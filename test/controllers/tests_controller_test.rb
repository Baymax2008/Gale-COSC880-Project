require 'test_helper'

class TestsControllerTest < ActionController::TestCase
  setup do
    @test = tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test" do
    assert_difference('Test.count') do
      post :create, test: { AllLabMoA: @test.AllLabMoA, Approved: @test.Approved, Test_Procedures: @test.Test_Procedures, end_date: @test.end_date, name: @test.name, network: @test.network, start_date: @test.start_date, testNum: @test.testNum }
    end

    assert_redirected_to test_path(assigns(:test))
  end

  test "should show test" do
    get :show, id: @test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test
    assert_response :success
  end

  test "should update test" do
    patch :update, id: @test, test: { AllLabMoA: @test.AllLabMoA, Approved: @test.Approved, Test_Procedures: @test.Test_Procedures, end_date: @test.end_date, name: @test.name, network: @test.network, start_date: @test.start_date, testNum: @test.testNum }
    assert_redirected_to test_path(assigns(:test))
  end

  test "should destroy test" do
    assert_difference('Test.count', -1) do
      delete :destroy, id: @test
    end

    assert_redirected_to tests_path
  end
end
