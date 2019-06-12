class UpdateUsersForGoogle < ActiveRecord::Migration[5.2]
  def change
   add_column :users, :google_token, :string
   add_column :users, :google_refresh_token, :string
   remove_column :users, :uid
 end
end
