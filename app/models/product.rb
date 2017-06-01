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

  #TODO Modify this to required style
  has_attached_file :product_image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :product_image, presence: true,
  content_type: { content_type: "image/jpeg" },
  size: { in: 0..100.kilobytes }

  has_attached_file :fabric_image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :fabric_image,content_type: { content_type: "image/jpeg" },
  size: { in: 0..100.kilobytes }
end
