class Address < ActiveRecord::Base
  belongs_to :Customer
  has_many :billing_orders, :class_name => "Order",:foreign_key => "billing_address_id" 
  has_many :shipping_orders, :class_name => "Order", :foreign_key => "shipping_address_id"
end
