json.extract! job, :id, :job_name, :job_discription, :job_hire_type, :job_last_date_to_apply, :job_place_city, :job_place_town, :company_id, :created_at, :updated_at
json.url job_url(job, format: :json)