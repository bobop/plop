json.extract! product, :id, :school_id, :supplier_id, :product_category_id, :name, :description, :sale_price, :slug, :created_at, :updated_at
json.url product_url(product, format: :json)
