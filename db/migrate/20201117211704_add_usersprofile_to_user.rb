class AddUsersprofileToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :screen_name,  :string
    add_column :users, :phone_number, :string
    add_column :users, :birthday,     :string
    add_column :users, :url,          :string
    add_column :users, :sex,          :integer
    
  end
end
