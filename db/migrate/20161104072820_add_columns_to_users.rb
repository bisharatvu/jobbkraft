class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_address_street, :string
    add_column :users, :user_address_zip, :string
    add_column :users, :user_address_city, :string
    add_column :users, :user_bank_account_no, :string
    add_column :users, :user_cell_phone, :string
    add_column :users, :user_phone_no, :string
    add_column :users, :user_first_name, :string
    add_column :users, :user_last_name, :string
    add_column :users, :user_gender, :string
    add_column :users, :user_freelancer_company, :boolean
    add_column :users, :user_company_number, :string
    add_column :users, :user_company_name, :string
    add_column :users, :user_account_progress, :integer
    add_column :users, :user_company_progress, :integer
  end
end

