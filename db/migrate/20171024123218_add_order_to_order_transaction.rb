class AddOrderToOrderTransaction < ActiveRecord::Migration
  def change
    add_reference :order_transactions, :order, index: true, foreign_key: true
  end
end
