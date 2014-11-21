require 'test_helper'

class RelationTypesControllerTest < ActionController::TestCase
  setup do
    @relation_type = relation_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relation_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relation_type" do
    assert_difference('RelationType.count') do
      post :create, relation_type: { name: @relation_type.name }
    end

    assert_redirected_to relation_type_path(assigns(:relation_type))
  end

  test "should show relation_type" do
    get :show, id: @relation_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @relation_type
    assert_response :success
  end

  test "should update relation_type" do
    patch :update, id: @relation_type, relation_type: { name: @relation_type.name }
    assert_redirected_to relation_type_path(assigns(:relation_type))
  end

  test "should destroy relation_type" do
    assert_difference('RelationType.count', -1) do
      delete :destroy, id: @relation_type
    end

    assert_redirected_to relation_types_path
  end
end
