json.extract! child, :id, :user_id, :school_id, :first_name, :last_name, :division_id, :grade_id, :room_id, :allergies, :dietry_requirements, :created_at, :updated_at
json.url child_url(child, format: :json)
