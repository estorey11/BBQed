class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :animal
      t.string :cut

      t.timestamps
    end
  end
end
