class CreateSmokers < ActiveRecord::Migration[5.2]
  def change
    create_table :smokers do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
