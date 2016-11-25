class AddUserPersonalNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_personal_number, :string
  end
end
