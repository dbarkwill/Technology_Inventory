require 'test_helper'

class AttrsControllerTest < ActionController::TestCase
  setup do
    @attr = attrs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attr" do
    assert_difference('Attr.count') do
      post :create, attr: { name: @attr.name }
    end

    assert_redirected_to attr_path(assigns(:attr))
  end

  test "should show attr" do
    get :show, id: @attr
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attr
    assert_response :success
  end

  test "should update attr" do
    patch :update, id: @attr, attr: { name: @attr.name }
    assert_redirected_to attr_path(assigns(:attr))
  end

  test "should destroy attr" do
    assert_difference('Attr.count', -1) do
      delete :destroy, id: @attr
    end

    assert_redirected_to attrs_path
  end
end
