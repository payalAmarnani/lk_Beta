require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #Test case shld pass because the save fails due to absence of name
  test "validate name presence" do
	  cat=Category.new(description: "Testing it out-Desc",category_type:"ReadyMade")
	  assert !cat.save, "Failed Due to no name"
  end

  test "validate name uniqueness" do
	  cat=Category.new(name:"Shirts",description: "Testing it out-Desc",category_type:"TailoredItems")
	  cat.save
	  cat2=Category.new(name:"Shirts",description:"Testing for name uniqueness", category_type:"TailoredItems")
	  assert !cat2.save, "Failed Due to no name"
  end

  test "validate category_type presence" do
 	  cat=Category.new(name:"Shirts",description: "Testing it out-Desc")
  	assert !cat.save, "Failed Due to no category_type presence"
  end

  test "hidden scope implementation" do
    cat=Category.new(name:"Shirts",description: "Testing it out-Desc",category_type:"TailoredItems", hidden:false)
    cat.save
    cat2=Category.new(name:"Suits",description:"Testing for name uniqueness", category_type:"TailoredItems", hidden: true)
    cat2.save
    test_cat=[]
    test_cat<<cat
    assert_equal Category.active,test_cat, "Failed scope impelementation"
  end


end
