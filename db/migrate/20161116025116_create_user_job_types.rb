class CreateUserJobTypes < ActiveRecord::Migration
  def change
    create_table :user_job_types do |t|
      t.boolean :hire
      t.boolean :consultant
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
