class Company < ActiveRecord::Base
  belongs_to :user, -> { where(is_company: true) }
  has_many :jobs, dependent: :destroy
  has_many :company_categories, dependent: :destroy
  has_many :categories
  has_many :prices, through: :categories

  mount_uploader :company_logo, ImageUploader

end
