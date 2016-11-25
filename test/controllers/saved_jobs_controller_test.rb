require 'test_helper'

class SavedJobsControllerTest < ActionController::TestCase
  setup do
    @saved_job = saved_jobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:saved_jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create saved_job" do
    assert_difference('SavedJob.count') do
      post :create, saved_job: { job_id: @saved_job.job_id, user_id: @saved_job.user_id }
    end

    assert_redirected_to saved_job_path(assigns(:saved_job))
  end

  test "should show saved_job" do
    get :show, id: @saved_job
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @saved_job
    assert_response :success
  end

  test "should update saved_job" do
    patch :update, id: @saved_job, saved_job: { job_id: @saved_job.job_id, user_id: @saved_job.user_id }
    assert_redirected_to saved_job_path(assigns(:saved_job))
  end

  test "should destroy saved_job" do
    assert_difference('SavedJob.count', -1) do
      delete :destroy, id: @saved_job
    end

    assert_redirected_to saved_jobs_path
  end
end
