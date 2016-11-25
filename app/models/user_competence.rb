class UserCompetence < ActiveRecord::Base
  belongs_to :user
  belongs_to :competence
  attr_accessor :competence_name

end
