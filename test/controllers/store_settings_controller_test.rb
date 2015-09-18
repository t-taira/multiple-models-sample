require 'test_helper'

class StoreSettingsControllerTest < ActionController::TestCase
  setup do
    @store_setting = store_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:store_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create store_setting" do
    assert_difference('StoreSetting.count') do
      post :create, store_setting: { name: @store_setting.name, store_name: @store_setting.store_name }
    end

    assert_redirected_to store_setting_path(assigns(:store_setting))
  end

  test "should show store_setting" do
    get :show, id: @store_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @store_setting
    assert_response :success
  end

  test "should update store_setting" do
    patch :update, id: @store_setting, store_setting: { name: @store_setting.name, store_name: @store_setting.store_name }
    assert_redirected_to store_setting_path(assigns(:store_setting))
  end

  test "should destroy store_setting" do
    assert_difference('StoreSetting.count', -1) do
      delete :destroy, id: @store_setting
    end

    assert_redirected_to store_settings_path
  end
end
