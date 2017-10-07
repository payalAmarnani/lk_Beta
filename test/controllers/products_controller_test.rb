require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { active: @product.active, buttons: @product.buttons, category_id: @product.category_id, color: @product.color, fabric: @product.fabric, gst_applicable: @product.gst_applicable, hidden: @product.hidden, lining_fabric: @product.lining_fabric, long_description: @product.long_description, new: @product.new, occasion: @product.occasion, pattern: @product.pattern, price: @product.price, product_code: @product.product_code, product_name: @product.product_name, season: @product.season, short_description: @product.short_description, stock_level: @product.stock_level, supplier_code: @product.supplier_code, yarn: @product.yarn }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { active: @product.active, buttons: @product.buttons, category_id: @product.category_id, color: @product.color, fabric: @product.fabric, gst_applicable: @product.gst_applicable, hidden: @product.hidden, lining_fabric: @product.lining_fabric, long_description: @product.long_description, new: @product.new, occasion: @product.occasion, pattern: @product.pattern, price: @product.price, product_code: @product.product_code, product_name: @product.product_name, season: @product.season, short_description: @product.short_description, stock_level: @product.stock_level, supplier_code: @product.supplier_code, yarn: @product.yarn }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
