class CreateJobRequirements < ActiveRecord::Migration
  def change
    create_table :job_requirements do |t|
      t.string :requirement_name
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
