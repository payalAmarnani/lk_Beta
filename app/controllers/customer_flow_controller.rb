class CustomerFlowController < ApplicationController
  def homepage
  	@categories=Category.active
  end

  def catalog
  	@cat=Category.find(params[:category_id])
  	@products=@cat.products.active.in_stock
  end

  def product_details
  @product=Product.find(params[:product_id])
  end

end
