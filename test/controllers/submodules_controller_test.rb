require 'test_helper'

class SubmodulesControllerTest < ActionController::TestCase
  setup do
    @submodule = submodules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:submodules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create submodule" do
    assert_difference('Submodule.count') do
      post :create, submodule: { deadline: @submodule.deadline, desc: @submodule.desc, name: @submodule.name, score: @submodule.score }
    end

    assert_redirected_to submodule_path(assigns(:submodule))
  end

  test "should show submodule" do
    get :show, id: @submodule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @submodule
    assert_response :success
  end

  test "should update submodule" do
    patch :update, id: @submodule, submodule: { deadline: @submodule.deadline, desc: @submodule.desc, name: @submodule.name, score: @submodule.score }
    assert_redirected_to submodule_path(assigns(:submodule))
  end

  test "should destroy submodule" do
    assert_difference('Submodule.count', -1) do
      delete :destroy, id: @submodule
    end

    assert_redirected_to submodules_path
  end
end
