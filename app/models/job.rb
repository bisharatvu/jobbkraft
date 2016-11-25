class Job < ActiveRecord::Base
  belongs_to :company
  has_many :job_applications, dependent: :destroy
  has_many :users, through: :job_applications
  has_many :extra_questions, dependent: :destroy
  has_many :job_requirements, dependent: :destroy
  accepts_nested_attributes_for :extra_questions, allow_destroy: true
  accepts_nested_attributes_for :job_requirements, allow_destroy: true
  include PgSearch
  multisearchable against: [:job_name, :job_discription, :job_hire_type, :job_place_city, :job_place_town]
  pg_search_scope :search, against: [:job_name, :job_discription, :job_hire_type, :job_place_city, :job_place_town,
                                     :job_company_address_city, :job_status, :created_at],
                  :using => {
                              :tsearch => {:any_word => true},
                              :dmetaphone => {:any_word => true, :sort_only => true}
                            },
                  :order_within_rank => "jobs.created_at DESC"

  pg_search_scope :search_job_town, against: [:job_company_address_city],
                  using: {tsearch: {prefix: true}}
  pg_search_scope :search_job_status, against: [:job_status],
                  using: {tsearch: {prefix: true}}



  def self.text_search(query, town, status)
      if query.present? && town.present? && status.present?
        search(query + " "+ town + " "+ status)
      elsif query.present? && town.present? && !status.present?
        search(query + " "+ town)
      elsif query.present? && !town.present? && status.present?
        search(query + " "+ status)
      elsif !query.present? && town.present? && status.present?
        search(town + " "+ status)
      elsif !query.present? && !town.present? && status.present?
        search(status)
      elsif !query.present? && town.present? && !status.present?
        search(town)
      elsif query.present? && !town.present? && !status.present?
        search(query)
      else
        all
      end
  end
end
