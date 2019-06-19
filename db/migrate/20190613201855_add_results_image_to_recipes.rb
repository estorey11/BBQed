class AddResultsImageToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_attachment :recipes, :results_image
  end
end
