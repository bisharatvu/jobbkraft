class AddUserProfileProgressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_profile_progress, :integer, null: false, default: 0
  end
end
