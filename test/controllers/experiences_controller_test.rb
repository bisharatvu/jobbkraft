require 'test_helper'

class ExperiencesControllerTest < ActionController::TestCase
  setup do
    @experience = experiences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experience" do
    assert_difference('Experience.count') do
      post :create, experience: { experience_branch: @experience.experience_branch, experience_company_name: @experience.experience_company_name, experience_date_from: @experience.experience_date_from, experience_date_to: @experience.experience_date_to, experience_description: @experience.experience_description, experience_i_am_work_here: @experience.experience_i_am_work_here, experience_title: @experience.experience_title, user_id: @experience.user_id }
    end

    assert_redirected_to experience_path(assigns(:experience))
  end

  test "should show experience" do
    get :show, id: @experience
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @experience
    assert_response :success
  end

  test "should update experience" do
    patch :update, id: @experience, experience: { experience_branch: @experience.experience_branch, experience_company_name: @experience.experience_company_name, experience_date_from: @experience.experience_date_from, experience_date_to: @experience.experience_date_to, experience_description: @experience.experience_description, experience_i_am_work_here: @experience.experience_i_am_work_here, experience_title: @experience.experience_title, user_id: @experience.user_id }
    assert_redirected_to experience_path(assigns(:experience))
  end

  test "should destroy experience" do
    assert_difference('Experience.count', -1) do
      delete :destroy, id: @experience
    end

    assert_redirected_to experiences_path
  end
end
