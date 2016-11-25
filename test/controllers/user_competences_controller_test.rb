require 'test_helper'

class UserCompetencesControllerTest < ActionController::TestCase
  setup do
    @user_competence = user_competences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_competences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_competence" do
    assert_difference('UserCompetence.count') do
      post :create, user_competence: { competence_id: @user_competence.competence_id, user_id: @user_competence.user_id }
    end

    assert_redirected_to user_competence_path(assigns(:user_competence))
  end

  test "should show user_competence" do
    get :show, id: @user_competence
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_competence
    assert_response :success
  end

  test "should update user_competence" do
    patch :update, id: @user_competence, user_competence: { competence_id: @user_competence.competence_id, user_id: @user_competence.user_id }
    assert_redirected_to user_competence_path(assigns(:user_competence))
  end

  test "should destroy user_competence" do
    assert_difference('UserCompetence.count', -1) do
      delete :destroy, id: @user_competence
    end

    assert_redirected_to user_competences_path
  end
end
