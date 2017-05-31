class Category < ActiveRecord::Base
	validates :name, presence:true, uniqueness: true
	validates :category_type, presence:true
	#TODO db:seed categories
end
