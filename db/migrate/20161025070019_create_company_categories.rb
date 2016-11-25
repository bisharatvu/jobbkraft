class CreateCompanyCategories < ActiveRecord::Migration
  def change
    create_table :company_categories do |t|
      t.string :category_name
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
