require 'test_helper'

class DeviceGroupsControllerTest < ActionController::TestCase
  setup do
    @device_group = device_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:device_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create device_group" do
    assert_difference('DeviceGroup.count') do
      post :create, device_group: { name: @device_group.name }
    end

    assert_redirected_to device_group_path(assigns(:device_group))
  end

  test "should show device_group" do
    get :show, id: @device_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @device_group
    assert_response :success
  end

  test "should update device_group" do
    patch :update, id: @device_group, device_group: { name: @device_group.name }
    assert_redirected_to device_group_path(assigns(:device_group))
  end

  test "should destroy device_group" do
    assert_difference('DeviceGroup.count', -1) do
      delete :destroy, id: @device_group
    end

    assert_redirected_to device_groups_path
  end
end
