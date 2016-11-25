class CreateJobs < ActiveRecord::Migration
    def change
        create_table :jobs do |t|
            t.string :job_name
            t.text   :job_discription
            t.string :job_hire_type
            t.string :job_last_date_to_apply
            t.string :job_place_city
            t.string :job_place_town
            t.text   :job_questions
            t.references :company, index: true, foreign_key: true

            t.timestamps null: false
        end
    end
end
