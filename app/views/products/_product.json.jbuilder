json.extract! product, :id, :category_id, :product_name, :price, :stock_level, :supplier_code, :product_code, :short_description, :long_description, :active, :hidden, :new, :gst_applicable, :color, :pattern, :season, :occasion, :fabric, :yarn, :buttons, :lining_fabric, :created_at, :updated_at
json.url product_url(product, format: :json)
