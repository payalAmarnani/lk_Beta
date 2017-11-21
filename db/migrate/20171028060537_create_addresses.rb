class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :Customer, index: true, foreign_key: true
      t.text :address_1
      t.text :street
      t.string :suburb
      t.string :state
      t.string :zipcode
      t.string :country

      t.timestamps null: false
    end
  end
end
