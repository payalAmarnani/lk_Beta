json.extract! customer_group, :id, :name, :group_type, :hidden, :active, :created_at, :updated_at
json.url customer_group_url(customer_group, format: :json)
