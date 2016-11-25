class AddColumnsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :job_status, :string, default: 'review'
    add_column :jobs, :job_type, :string
    add_column :jobs, :job_category, :string
    add_column :jobs, :job_tasks, :text
    add_column :jobs, :job_workers_needed, :integer
    add_column :jobs, :job_hire_in_house, :boolean
    add_column :jobs, :job_gfl, :integer
    add_column :jobs, :job_company_index, :string
    add_column :jobs, :job_company_description, :string
    add_column :jobs, :job_company_address, :string
    add_column :jobs, :job_company_address_zip, :string
    add_column :jobs, :job_company_address_city, :string
    add_column :jobs, :job_consultant_type, :string
    add_column :jobs, :job_start_time, :string
    add_column :jobs, :job_consultant_duration, :integer
    add_column :jobs, :job_consultant_repeat_type, :string
    add_column :jobs, :job_consultant_repeat_days, :integer
    add_column :jobs, :job_price_per_hour, :float
    add_column :jobs, :job_total_cost_per_person, :float
    add_column :jobs, :accept_agreement, :boolean
  end
end