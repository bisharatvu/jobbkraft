json.extract! job_application, :id, :apply_job_info, :price_per_hour, :job_id, :user_id, :created_at, :updated_at
json.url job_application_url(job_application, format: :json)