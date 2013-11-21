require 'test_helper'

class TypeSetsControllerTest < ActionController::TestCase
  setup do
    @type_set = type_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_set" do
    assert_difference('TypeSet.count') do
      post :create, type_set: { recipeID: @type_set.recipeID, typeID: @type_set.typeID }
    end

    assert_redirected_to type_set_path(assigns(:type_set))
  end

  test "should show type_set" do
    get :show, id: @type_set
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_set
    assert_response :success
  end

  test "should update type_set" do
    patch :update, id: @type_set, type_set: { recipeID: @type_set.recipeID, typeID: @type_set.typeID }
    assert_redirected_to type_set_path(assigns(:type_set))
  end

  test "should destroy type_set" do
    assert_difference('TypeSet.count', -1) do
      delete :destroy, id: @type_set
    end

    assert_redirected_to type_sets_path
  end
end
