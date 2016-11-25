class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.text :apply_job_info
      t.decimal :price_per_hour
      t.references :job, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
