class Order < ActiveRecord::Base
  belongs_to :order_status
  has_many :order_items
  has_many :order_transactions
  has_one :payment
  belongs_to :customer
  belongs_to :billing_address, :class_name => "Address"
  belongs_to :shipping_address, :class_name => "Address"
  before_create :set_order_status
  before_save :update_subtotal

accepts_nested_attributes_for :shipping_address
accepts_nested_attributes_for :billing_address

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end



  private
  def set_order_status
    self.order_status_id = 1
  end
 def update_subtotal
    self[:subtotal] = subtotal
  end
end


