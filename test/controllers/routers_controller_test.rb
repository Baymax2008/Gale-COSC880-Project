require 'test_helper'

class RoutersControllerTest < ActionController::TestCase
  setup do
    @router = routers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:routers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create router" do
    assert_difference('Router.count') do
      post :create, router: { Network: @router.Network, Num_Ports: @router.Num_Ports, description: @router.description, serialNum: @router.serialNum }
    end

    assert_redirected_to router_path(assigns(:router))
  end

  test "should show router" do
    get :show, id: @router
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @router
    assert_response :success
  end

  test "should update router" do
    patch :update, id: @router, router: { Network: @router.Network, Num_Ports: @router.Num_Ports, description: @router.description, serialNum: @router.serialNum }
    assert_redirected_to router_path(assigns(:router))
  end

  test "should destroy router" do
    assert_difference('Router.count', -1) do
      delete :destroy, id: @router
    end

    assert_redirected_to routers_path
  end
end
