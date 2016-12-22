require 'test_helper'

class EncryptersControllerTest < ActionController::TestCase
  setup do
    @encrypter = encrypters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:encrypters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create encrypter" do
    assert_difference('Encrypter.count') do
      post :create, encrypter: { description: @encrypter.description, expiration: @encrypter.expiration, serialNum: @encrypter.serialNum, speed: @encrypter.speed, test: @encrypter.test }
    end

    assert_redirected_to encrypter_path(assigns(:encrypter))
  end

  test "should show encrypter" do
    get :show, id: @encrypter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @encrypter
    assert_response :success
  end

  test "should update encrypter" do
    patch :update, id: @encrypter, encrypter: { description: @encrypter.description, expiration: @encrypter.expiration, serialNum: @encrypter.serialNum, speed: @encrypter.speed, test: @encrypter.test }
    assert_redirected_to encrypter_path(assigns(:encrypter))
  end

  test "should destroy encrypter" do
    assert_difference('Encrypter.count', -1) do
      delete :destroy, id: @encrypter
    end

    assert_redirected_to encrypters_path
  end
end
