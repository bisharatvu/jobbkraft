class AddCategoryNameToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :category_name, :string
  end
end
