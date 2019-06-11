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
end
