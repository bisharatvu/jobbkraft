class CreateUserJobCategories < ActiveRecord::Migration
  def change
    create_table :user_job_categories do |t|
      t.boolean :administrative
      t.boolean :brand_ambassador
      t.boolean :customer_service
      t.boolean :data_entry
      t.boolean :delivery
      t.boolean :event_staff
      t.boolean :warehousing
      t.boolean :general_labor
      t.boolean :market_research
      t.boolean :marketing
      t.boolean :merchandising
      t.boolean :sales
      t.boolean :software_testing
      t.boolean :volunteer
      t.boolean :washing
      t.boolean :other
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
