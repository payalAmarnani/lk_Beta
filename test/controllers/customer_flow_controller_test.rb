require 'test_helper'

class CustomerFlowControllerTest < ActionController::TestCase
  test "should get homepage" do
    get :homepage
    assert_response :success
  end

  test "should get catalog" do
    get :catalog
    assert_response :success
  end

end
