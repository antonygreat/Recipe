require 'test_helper'

class IngredientGroupsControllerTest < ActionController::TestCase
  setup do
    @ingredient_group = ingredient_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingredient_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingredient_group" do
    assert_difference('IngredientGroup.count') do
      post :create, ingredient_group: { name: @ingredient_group.name }
    end

    assert_redirected_to ingredient_group_path(assigns(:ingredient_group))
  end

  test "should show ingredient_group" do
    get :show, id: @ingredient_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ingredient_group
    assert_response :success
  end

  test "should update ingredient_group" do
    patch :update, id: @ingredient_group, ingredient_group: { name: @ingredient_group.name }
    assert_redirected_to ingredient_group_path(assigns(:ingredient_group))
  end

  test "should destroy ingredient_group" do
    assert_difference('IngredientGroup.count', -1) do
      delete :destroy, id: @ingredient_group
    end

    assert_redirected_to ingredient_groups_path
  end
end
