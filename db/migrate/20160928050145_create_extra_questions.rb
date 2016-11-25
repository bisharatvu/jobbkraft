class CreateExtraQuestions < ActiveRecord::Migration
  def change
    create_table :extra_questions do |t|
      t.text :job_question
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
