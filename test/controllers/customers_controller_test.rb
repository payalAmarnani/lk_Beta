require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { CustomerGroup_id: @customer.CustomerGroup_id, active: @customer.active, company_name: @customer.company_name, customer_comment: @customer.customer_comment, email_address: @customer.email_address, email_signup: @customer.email_signup, first_name: @customer.first_name, password: @customer.password, position: @customer.position, salutation: @customer.salutation, surname: @customer.surname, username: @customer.username, vip: @customer.vip }
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    patch :update, id: @customer, customer: { CustomerGroup_id: @customer.CustomerGroup_id, active: @customer.active, company_name: @customer.company_name, customer_comment: @customer.customer_comment, email_address: @customer.email_address, email_signup: @customer.email_signup, first_name: @customer.first_name, password: @customer.password, position: @customer.position, salutation: @customer.salutation, surname: @customer.surname, username: @customer.username, vip: @customer.vip }
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
end
