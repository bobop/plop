json.extract! supplier, :id, :school_id, :name, :description, :address, :contact_name, :contact_phone, :contact_email, :slug, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
