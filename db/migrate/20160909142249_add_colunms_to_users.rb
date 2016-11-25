class AddColunmsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image_url, :string
    add_column :users, :about_me, :text
    add_column :users, :video_url, :string
  end
end
