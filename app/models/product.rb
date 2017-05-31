class Product < ActiveRecord::Base
  belongs_to :category
  #TODO Add Validations
  #TODO Add image save on S3 server
end
