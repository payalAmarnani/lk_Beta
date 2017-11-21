class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.references :CustomerGroup, index: true, foreign_key: true
      t.string :first_name
      t.string :salutation
      t.string :surname
      t.string :company_name
      t.string :position
      t.string :email_address
      t.string :username
      t.string :password
      t.boolean :email_signup
      t.text :customer_comment
      t.boolean :vip
      t.boolean :active

      t.timestamps null: false
    end
  end
end
