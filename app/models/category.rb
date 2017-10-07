class Category < ActiveRecord::Base
	validates :name, presence:true, uniqueness: true
	validates :category_type, presence:true
	has_many :products
	scope :active, -> { where(hidden: false) }
	#TODO db:seed categories

	def set_products_active(category)
		@pdt=self.products.inactive
		@pdt.each do |p|
			p.update(:active=>true)
		end
	end
	def set_products_inactive(category)
		@pdt=self.products.active
		@pdt.each do |p|
			p.update(:active=>false)
		end
	end

end
