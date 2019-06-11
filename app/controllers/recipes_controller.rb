class RecipesController < ApplicationController

  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to root, alert: "You must log in to create recipes"
    else
      @recipe = Recipe.new(user_id: params[:user_id])
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def show
  end

  def index
  end

  private

  def recipe_params
    params.require(:recipe).permit(:user_id, :food_id, :smoker_id, :food_unit, :food_amount, :temp, :wood, :time, :result, :rub, :wrap)
  end
end
