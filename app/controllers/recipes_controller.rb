require 'pry'

class RecipesController < ApplicationController


  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to root, alert: "You must log in to create recipes"
    else
      @recipe = Recipe.new(user_id: params[:user_id])
      @recipe.food= Food.new
      @recipe.smoker=Smoker.new
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save!
      redirect_to @recipe
    else
      render :new
    end
  end

  def show
    @recipe=Recipe.find_by(id: params[:id])
  end

  def index
  end

  def edit
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      if user.nil?
        redirect_to recipes_path, alert: "User not found."
      else
        @recipe = user.recipes.find_by(id: params[:id])
        redirect_to user_recipes_path(user), alert: "Recipe not found." if @recipe.nil?
      end
    else
      @recipe=Recipe.find_by(id: params[:id])
    end
  end

  def update
    @recipe=Recipe.find_by(id: params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def index
    @recipes=Recipe.all
  end

  private

  def recipe_params
    params.require(:recipe).permit(:user_id, {food_attributes: [:animal, :cut]}, {smoker_attributes: [:name, :smoker_type]}, :food_unit, :food_amount, :temp, :wood, :time, :result, :rub, :wrap)
  end
end
