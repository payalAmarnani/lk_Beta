class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.references :Customer, index: true, foreign_key: true
      t.decimal :chest, precision: 12, scale: 3
      t.decimal :neck, precision: 12, scale: 3
      t.decimal :waist, precision: 12, scale: 3
      t.decimal :hip, precision: 12, scale: 3
      t.decimal :shirt_length, precision: 12, scale: 3
      t.decimal :sleeve_length, precision: 12, scale: 3
      t.decimal :back, precision: 12, scale: 3
      t.decimal :wrist, precision: 12, scale: 3
      t.decimal :sleeve_width, precision: 12, scale: 3
      t.string :shoulder_type

      t.timestamps null: false
    end
  end
end
