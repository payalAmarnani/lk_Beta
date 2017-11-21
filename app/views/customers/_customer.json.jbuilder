json.extract! customer, :id, :CustomerGroup_id, :first_name, :salutation, :surname, :company_name, :position, :email_address, :username, :password, :email_signup, :customer_comment, :vip, :active, :created_at, :updated_at
json.url customer_url(customer, format: :json)
