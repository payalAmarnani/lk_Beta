class CreateCustomerGroups < ActiveRecord::Migration
  def change
    create_table :customer_groups do |t|
      t.string :name
      t.string :group_type
      t.boolean :hidden
      t.boolean :active

      t.timestamps null: false
    end
  end
end
