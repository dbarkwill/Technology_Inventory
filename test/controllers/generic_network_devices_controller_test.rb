require 'test_helper'

class GenericNetworkDevicesControllerTest < ActionController::TestCase
  setup do
    @generic_network_device = generic_network_devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:generic_network_devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create generic_network_device" do
    assert_difference('GenericNetworkDevice.count') do
      post :create, generic_network_device: { MAC: @generic_network_device.MAC, description: @generic_network_device.description, name: @generic_network_device.name }
    end

    assert_redirected_to generic_network_device_path(assigns(:generic_network_device))
  end

  test "should show generic_network_device" do
    get :show, id: @generic_network_device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @generic_network_device
    assert_response :success
  end

  test "should update generic_network_device" do
    patch :update, id: @generic_network_device, generic_network_device: { MAC: @generic_network_device.MAC, description: @generic_network_device.description, name: @generic_network_device.name }
    assert_redirected_to generic_network_device_path(assigns(:generic_network_device))
  end

  test "should destroy generic_network_device" do
    assert_difference('GenericNetworkDevice.count', -1) do
      delete :destroy, id: @generic_network_device
    end

    assert_redirected_to generic_network_devices_path
  end
end
