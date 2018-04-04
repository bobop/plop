json.extract! event, :id, :program_id, :name, :description, :start_at, :slug, :created_at, :updated_at
json.url event_url(event, format: :json)
