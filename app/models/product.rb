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
  scope :inactive, -> { where(active: false) }
  # scope :in_stock,->{where(stock_level:>1.0)}



  #TODO Modify this to required style
  has_attached_file :product_image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :product_image, presence: true,
  content_type: { content_type: "image/jpeg" },
  size: { in: 0..2.megabytes }

  has_attached_file :fabric_image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :fabric_image,content_type: { content_type: "image/jpeg" },
  size: { in: 0..2.megabytes}

  def self.in_stock
    where("stock_level > ?",1.0)
  end

end
