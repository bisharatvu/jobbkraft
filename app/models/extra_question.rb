class ExtraQuestion < ActiveRecord::Base
  belongs_to :job
  has_one :answer, dependent: :destroy
end
