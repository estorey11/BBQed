require 'pry'

class RecipesController < ApplicationController


  def new
    @user = User.find_by(id: params[:user_id])

    if !helpers.logged_in? || @user!=helpers.current_user
      redirect_to root_path, alert: "You must log in to create recipes"
    else
      @recipe = Recipe.new(user_id: params[:user_id])
      @recipe.food= Food.new
      @recipe.smoker=Smoker.new
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.valid?
      @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def show
    @recipe=Recipe.find_by(id: params[:id])
    @comment=Comment.new

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @recipe }
    end
  end


  def edit
    @user = User.find_by(id: params[:user_id])

    if !helpers.logged_in? || @user!=helpers.current_user
      redirect_to root_path, alert: "You must be logged in to edit your recipes."
    else
      if @user.nil?
        redirect_to recipes_path, alert: "User not found."
      else
        @recipe = @user.recipes.find_by(id: params[:id])
        redirect_to user_recipes_path(@user), alert: "Recipe not found." if @recipe.nil?
      end
    end
  end

  def update
    @recipe=Recipe.find_by(id: params[:id])
    @recipe.assign_attributes(recipe_params)
    if @recipe.valid?
      @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def index
    if !params[:smoker_type].blank? && !params[:animal].blank?
      @recipes = Recipe.with_animal_and_smoker_type(params[:animal], params[:smoker_type])
    elsif !params[:animal].blank?
      @recipes = Recipe.with_animal(params[:animal])
    elsif !params[:smoker_type].blank?
      @recipes = Recipe.with_smoker_type(params[:smoker_type])
    else
      @recipes=Recipe.all
    end
  end

  def destroy
    @recipe=Recipe.find_by(id: params[:id])
    @recipe.delete
    redirect_to user_path(helpers.current_user)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:user_id, {food_attributes: [:animal, :cut]}, {smoker_attributes: [:name, :smoker_type]}, :food_unit, :food_amount, :temp, :wood, :time, :result, :rub, :wrap, :results_image)
  end
end
