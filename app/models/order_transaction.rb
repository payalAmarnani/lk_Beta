class OrderTransaction < ActiveRecord::Base
  belongs_to :payment
  belongs_to :order

  before_save check_sucess

	serialize :params
  
  def response=(response)
    self.success       = response.success?
    self.authorization = response.authorization
    self.message       = response.message
    self.params        = response.params
  rescue ActiveMerchant::ActiveMerchantError => e
    self.success       = false
    self.authorization = nil
    self.message       = e.message
    self.params        = {}
  end

  def check_success
    if success
      self.order.status=OrderStatus.find(2)
    end
  end
end
