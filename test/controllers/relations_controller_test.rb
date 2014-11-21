require 'test_helper'

class RelationsControllerTest < ActionController::TestCase
  setup do
    @relation = relations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relation" do
    assert_difference('Relation.count') do
      post :create, relation: { ally_id: @relation.ally_id, candidate_id: @relation.candidate_id, link_id: @relation.link_id, relation_type_id: @relation.relation_type_id }
    end

    assert_redirected_to relation_path(assigns(:relation))
  end

  test "should show relation" do
    get :show, id: @relation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @relation
    assert_response :success
  end

  test "should update relation" do
    patch :update, id: @relation, relation: { ally_id: @relation.ally_id, candidate_id: @relation.candidate_id, link_id: @relation.link_id, relation_type_id: @relation.relation_type_id }
    assert_redirected_to relation_path(assigns(:relation))
  end

  test "should destroy relation" do
    assert_difference('Relation.count', -1) do
      delete :destroy, id: @relation
    end

    assert_redirected_to relations_path
  end
end
