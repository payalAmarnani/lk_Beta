class RemoveEmailAddressFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :email_address, :string
    remove_column :customers, :password, :string
  end
end
