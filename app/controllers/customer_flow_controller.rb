class CustomerFlowController < ApplicationController
  before_action :authenticate_customer!, except: [:homepage, :catalog,:product_details]

  def homepage
  	@categories=Category.active
  end

  def catalog
  	@cat=Category.find(params[:category_id])
  	@products=@cat.products.active.in_stock
    ### FILTERS###
    @products = @products.color(params[:colors]) if params[:colors].present?
    @products = @products.pattern(params[:patterns]) if params[:patterns].present?
    @products = @products.occasion(params[:occasions]) if params[:occasions].present?
    @products = @products.yarn(params[:yarns]) if params[:yarns].present?
    @order_item = current_order.order_items.new
  end

  def product_details
  @product=Product.find(params[:product_id])
  end
  
  def cart_checkout_measurements
    @order=current_order
    @customer=current_customer
    @order.customer=@customer
    @order.save
    if @customer.measurement.nil?
      @measurement=Measurement.new
      @measurement.Customer_id=@customer.id
      @measurement.save
    else
    @measurement=@customer.measurement
     end
  end
  
  def cart_checkout_billing_shipping
    @customer=current_customer
   @customer_addresses=@customer.addresses
   @order=current_order
   respond_to do |format|
      if !params[:shipping_id].nil?
        @order.shipping_address_id=params[:shipping_id].to_i
        @order.save
        format.html {}
        format.js 
      else
        format.html {}
      end
    end

  end

  def checkout_payment
   


    # @order=current_order
    # @customer=current_customer

    # @order.shipping_address = @order.billing_address if params[:checkbox_use_same_address] == true
  end

  def update_addresses
     @order=current_order
     @customer=current_customer
      @order.shipping_address=@order.create_shipping_address(address1: params[:shipping_address][:address1],address2: params[:shipping_address][:address2], city: params[:shipping_address][:city],state_code: params[:shipping_address][:state_code],postal_code: params[:shipping_address][:postal_code],country_code: params[:shipping_address][:country_code],customer_id: @customer.id,addressable_type: 'Shipping')
        @order.shipping_address_id=@order.shipping_address.id
        @order.save

      if params[:order][:bill_to_shipping_address] == "1"
       @order.billing_address_id = @order.shipping_address.id
       @order.save
      else
       @order.billing_address=@order.create_billing_address(address1: params[:billing_address][:address1],address2: params[:billing_address][:address2], city: params[:billing_address][:city],state_code: params[:billing_address][:state_code],postal_code: params[:billing_address][:postal_code],country_code: params[:billing_address][:country_code],customer_id: @customer.id,addressable_type: 'Billing')
      @order.billing_address_id=@order.billing_address.id
      @order.save

      end
    redirect_on_back_to customer_flow_edit_addresses_path
     redirect_to payment_path
  end

  def edit_addresses

  end

#   def update
#   @order_current=current_order

#   @mail = Mail.new(mail_params)
#   if @mail.save
#    redirect_to :root
#   end
# end

# private

# def mail_params
#  params.require(:mail).permit(:address, :type, :confirmed)
# end


end
