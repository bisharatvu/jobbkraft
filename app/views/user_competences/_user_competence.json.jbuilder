json.extract! user_competence, :id, :user_id, :competence_id, :created_at, :updated_at
json.url user_competence_url(user_competence, format: :json)