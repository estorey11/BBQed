class CreateSmokers < ActiveRecord::Migration[5.2]
  def change
    create_table :smokers do |t|
      t.string :name
      t.string :smoker_type

      t.timestamps
    end
  end
end
