class AddCompanyPhoneNumberToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :company_phone_number, :string
  end
end
