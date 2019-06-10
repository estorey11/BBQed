class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :food_amount
      t.string :food_unit
      t.integer :temp
      t.string :wood
      t.integer :time
      t.text :result
      t.string :rub
      t.string :wrap
      t.integer :user_id
      t.integer :food_id
      t.integer :smoker_id

      t.timestamps
    end
  end
end
