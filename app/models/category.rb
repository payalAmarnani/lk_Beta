class Category < ActiveRecord::Base
	validates :name, presence:true, uniqueness: true
	validates :category_type, presence:true
	has_many :products
	scope :active, -> { where(hidden: false) }
	#TODO db:seed categories


end
