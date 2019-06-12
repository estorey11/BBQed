module RecipesHelper
  def unique_animals
    animals=[]
    Food.all.each{|food| animals << food.animal}
    animals.uniq
  end

  def unique_cuts
    cuts=[]
    Food.all.each{|food| cuts << food.cut}
    cuts.uniq
  end

  def unique_smokers
    smokers=[]
    Smoker.all.each{|smoker| smokers << smoker.name}
    smokers.uniq
  end

  def unique_smoker_types
    smokers=[]
    Smoker.all.each{|smoker| smokers << smoker.smoker_type}
    smokers.uniq
  end

  def food_display(recipe)
    display="#{recipe.food_amount} #{recipe.food_unit} "
    display << recipe.food.animal if recipe.food.animal !="None"
    display << " #{recipe.food.cut} by #{recipe.user.username}"
    display
  end

  def edit_if_allowed(user)
    if user == current_user
       link_to 'Edit this recipe', edit_user_recipe_path(@recipe.user, @recipe)
    end
  end
end
