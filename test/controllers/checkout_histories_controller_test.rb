require 'test_helper'

class CheckoutHistoriesControllerTest < ActionController::TestCase
  setup do
    @checkout_history = checkout_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:checkout_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create checkout_history" do
    assert_difference('CheckoutHistory.count') do
      post :create, checkout_history: { device_id: @checkout_history.device_id, name: @checkout_history.name, notes: @checkout_history.notes }
    end

    assert_redirected_to checkout_history_path(assigns(:checkout_history))
  end

  test "should show checkout_history" do
    get :show, id: @checkout_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @checkout_history
    assert_response :success
  end

  test "should update checkout_history" do
    patch :update, id: @checkout_history, checkout_history: { device_id: @checkout_history.device_id, name: @checkout_history.name, notes: @checkout_history.notes }
    assert_redirected_to checkout_history_path(assigns(:checkout_history))
  end

  test "should destroy checkout_history" do
    assert_difference('CheckoutHistory.count', -1) do
      delete :destroy, id: @checkout_history
    end

    assert_redirected_to checkout_histories_path
  end
end
