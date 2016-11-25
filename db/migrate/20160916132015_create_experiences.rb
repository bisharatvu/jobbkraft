class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :experience_company_name
      t.string :experience_title
      t.string :experience_date_from
      t.string :experience_date_to
      t.boolean :experience_i_am_work_here
      t.string :experience_branch
      t.text :experience_description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
