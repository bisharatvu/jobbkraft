class AddCompetenceLevelToUserCompetences < ActiveRecord::Migration
  def change
    add_column :user_competences, :competence_level, :integer
  end
end
