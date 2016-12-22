require 'test_helper'

class TestApprovalsControllerTest < ActionController::TestCase
  setup do
    @test_approval = test_approvals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_approvals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_approval" do
    assert_difference('TestApproval.count') do
      post :create, test_approval: {  }
    end

    assert_redirected_to test_approval_path(assigns(:test_approval))
  end

  test "should show test_approval" do
    get :show, id: @test_approval
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_approval
    assert_response :success
  end

  test "should update test_approval" do
    patch :update, id: @test_approval, test_approval: {  }
    assert_redirected_to test_approval_path(assigns(:test_approval))
  end

  test "should destroy test_approval" do
    assert_difference('TestApproval.count', -1) do
      delete :destroy, id: @test_approval
    end

    assert_redirected_to test_approvals_path
  end
end
