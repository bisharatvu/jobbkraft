class CreateCompetences < ActiveRecord::Migration
  def change
    create_table :competences do |t|
      t.string :competence_name

      t.timestamps null: false
    end
  end
end
