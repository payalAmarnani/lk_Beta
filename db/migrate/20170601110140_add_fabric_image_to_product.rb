class AddFabricImageToProduct < ActiveRecord::Migration
  def change
  	add_attachment :products, :fabric_image
  end
end
