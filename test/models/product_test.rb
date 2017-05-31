require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "validate belongs_to presence" do
	  pdt=Product.new(product_name:"Blue SHirt", product_code:"LK001", short_description: "Testing it out-Desc",price: 222.23, stock_level:22.3)
	  assert !pdt.save, "Failed Due to no category"
  end
  test "validate product_name presence" do
	  pdt=Product.new(category:Category.first, product_code:"LK001", short_description: "Testing it out-Desc",price: 222.23, stock_level:22.3)
	  assert !pdt.save, pdt.errors.messages
  end

  test "validate product_code presence" do
  	  pdt=Product.new(category:Category.first, product_name:"Blue SHirt", short_description: "Testing it out-Desc",price: 222.23, stock_level:22.3)
	  assert !pdt.save, pdt.errors.messages
  end
  test "validate desc presence" do
  	  pdt=Product.new(category:Category.first, product_name:"Blue SHirt", product_code:"LK001",price: 222.23, stock_level:22.3)
	  assert !pdt.save, pdt.errors.messages
  end
  test "validate price presence" do
  	  pdt=Product.new(category:Category.first, product_name:"Blue SHirt", product_code:"LK001", short_description: "Testing it out-Desc", stock_level:22.3)
	  assert !pdt.save, pdt.errors.messages
  end
  test "validate price numericality" do
  	  pdt=Product.new(category:Category.first, product_name:"Blue SHirt", product_code:"LK001", short_description: "Testing it out-Desc",price: "XDDS", stock_level:22.3)
	  assert !pdt.save, pdt.errors.messages
  end
  test "validate stock_level presence" do
  	  pdt=Product.new(category:Category.first, product_name:"Blue SHirt", product_code:"LK001", short_description: "Testing it out-Desc",price: 22.3)
	  assert !pdt.save, pdt.errors.messages
  end
  test "validate stock_level numericality" do
  	  pdt=Product.new(category:Category.first, product_name:"Blue SHirt", product_code:"LK001", short_description: "Testing it out-Desc",price: 22.3, stock_level:"3ywew3")
	  assert !pdt.save, pdt.errors.messages
  end
  # pdt=Product.new(category:Category.first, product_name:"Blue SHirt", product_code:"LK001", short_description: "Testing it out-Desc",price: 222.23, stock_level:22.3)
  test "scope->active" do
  	pdt=Product.new(category:Category.first, product_name:"Blue SHirt", product_code:"LK001", short_description: "Testing it out-Desc",price: 222.23, stock_level:22.3,active: false)
	pdt.save
	pdt1=Product.new(category:Category.first, product_name:"Black SHirt", product_code:"LK002", short_description: "Testing it out-Desc",price: 222.23, stock_level:22.3,active: true)
  	pdt1.save
  	final_pdt=[]
  	final_pdt<<pdt1
  	assert_equal Product.active,final_pdt
  end

end
