class AddColumnsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :company_number, :string
    add_column :companies, :company_ftex, :boolean
    add_column :companies, :company_web_address, :string
    add_column :companies, :company_logo, :string
    add_column :companies, :company_invoice_address_street2, :string
    add_column :companies, :company_state, :string, default: 'review'
    add_column :companies, :invoice_person_name, :string
    add_column :companies, :invoice_person_name_phone_number, :string
  end
end
