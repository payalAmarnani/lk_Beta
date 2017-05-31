class Product < ActiveRecord::Base
  belongs_to :category
  #TODO Add Validations
  validates :product_name, presence: true
  validates :product_code, presence: true
  validates :short_description, presence: true
  validates :price, presence:true, numericality: true
  validates :stock_level, presence:true, numericality: true
  validates :category, presence: true

  scope :active, -> { where(active: true) }

  #TODO Add image save on S3 server
end
