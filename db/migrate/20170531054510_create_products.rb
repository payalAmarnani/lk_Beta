class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :category, index: true, foreign_key: true
      t.string :product_name
      t.decimal :price,:precision => 8, :scale => 2
      t.decimal :stock_level,:precision => 16, :scale => 2
      t.string :supplier_code
      t.string :product_code
      t.text :short_description
      t.text :long_description
      t.boolean :active
      t.boolean :hidden
      t.boolean :new
      t.boolean :gst_applicable
      t.string :color
      t.string :pattern
      t.string :season
      t.string :occasion
      t.string :fabric
      t.string :yarn
      t.string :buttons
      t.string :lining_fabric

      t.timestamps null: false
    end
  end
end
