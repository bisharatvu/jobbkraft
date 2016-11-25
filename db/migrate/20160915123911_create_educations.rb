class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :education_title
      t.string :education_school_name
      t.string :education_date_from
      t.string :education_date_to
      t.text :education_description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
