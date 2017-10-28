class CartsController < ApplicationController
  def show
      @order_items = current_order.order_items
  end

  def empty
  	@order_items = current_order.order_items
  	@order_items.each do |oi|
	  	@style=Style.find_by(:OrderItem_id=>oi.id)
	    @style.destroy
	    @oi.destroy
	end	
    redirect_to cart_path
  end
end
