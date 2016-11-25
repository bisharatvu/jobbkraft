class Competence < ActiveRecord::Base
  has_many :user_competences, dependent: :destroy
  has_many :users, through: :user_competences
end
