json.extract! saved_job, :id, :job_id, :user_id, :created_at, :updated_at
json.url saved_job_url(saved_job, format: :json)