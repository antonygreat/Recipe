require 'test_helper'

class IngredientSetsControllerTest < ActionController::TestCase
  setup do
    @ingredient_set = ingredient_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingredient_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingredient_set" do
    assert_difference('IngredientSet.count') do
      post :create, ingredient_set: { amountNum: @ingredient_set.amountNum, ingredientID: @ingredient_set.ingredientID, recipeID: @ingredient_set.recipeID, unitOfMeasure: @ingredient_set.unitOfMeasure }
    end

    assert_redirected_to ingredient_set_path(assigns(:ingredient_set))
  end

  test "should show ingredient_set" do
    get :show, id: @ingredient_set
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ingredient_set
    assert_response :success
  end

  test "should update ingredient_set" do
    patch :update, id: @ingredient_set, ingredient_set: { amountNum: @ingredient_set.amountNum, ingredientID: @ingredient_set.ingredientID, recipeID: @ingredient_set.recipeID, unitOfMeasure: @ingredient_set.unitOfMeasure }
    assert_redirected_to ingredient_set_path(assigns(:ingredient_set))
  end

  test "should destroy ingredient_set" do
    assert_difference('IngredientSet.count', -1) do
      delete :destroy, id: @ingredient_set
    end

    assert_redirected_to ingredient_sets_path
  end
end
