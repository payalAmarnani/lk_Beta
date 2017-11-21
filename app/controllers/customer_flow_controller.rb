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

  end

end
