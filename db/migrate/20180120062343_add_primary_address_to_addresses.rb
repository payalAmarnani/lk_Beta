class AddPrimaryAddressToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :primary_address, :boolean
  end
end
