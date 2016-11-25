class ChangeCoulmnDefaultValueToUsers < ActiveRecord::Migration
  def change
    change_column :users, :user_account_progress, :integer, null: false, default: 0
    change_column :users, :user_company_progress, :integer, null: false, default: 0
  end
end
