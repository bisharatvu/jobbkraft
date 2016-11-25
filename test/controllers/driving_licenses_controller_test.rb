require 'test_helper'

class DrivingLicensesControllerTest < ActionController::TestCase
  setup do
    @driving_license = driving_licenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:driving_licenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create driving_license" do
    assert_difference('DrivingLicense.count') do
      post :create, driving_license: { dl_a2: @driving_license.dl_a2, dl_a: @driving_license.dl_a, dl_aa: @driving_license.dl_aa, dl_am: @driving_license.dl_am, dl_b: @driving_license.dl_b, dl_be: @driving_license.dl_be, dl_c1: @driving_license.dl_c1, dl_c1e: @driving_license.dl_c1e, dl_c: @driving_license.dl_c, dl_ce: @driving_license.dl_ce, dl_d1: @driving_license.dl_d1, dl_d1e: @driving_license.dl_d1e, dl_d: @driving_license.dl_d, dl_de: @driving_license.dl_de, user_id: @driving_license.user_id }
    end

    assert_redirected_to driving_license_path(assigns(:driving_license))
  end

  test "should show driving_license" do
    get :show, id: @driving_license
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @driving_license
    assert_response :success
  end

  test "should update driving_license" do
    patch :update, id: @driving_license, driving_license: { dl_a2: @driving_license.dl_a2, dl_a: @driving_license.dl_a, dl_aa: @driving_license.dl_aa, dl_am: @driving_license.dl_am, dl_b: @driving_license.dl_b, dl_be: @driving_license.dl_be, dl_c1: @driving_license.dl_c1, dl_c1e: @driving_license.dl_c1e, dl_c: @driving_license.dl_c, dl_ce: @driving_license.dl_ce, dl_d1: @driving_license.dl_d1, dl_d1e: @driving_license.dl_d1e, dl_d: @driving_license.dl_d, dl_de: @driving_license.dl_de, user_id: @driving_license.user_id }
    assert_redirected_to driving_license_path(assigns(:driving_license))
  end

  test "should destroy driving_license" do
    assert_difference('DrivingLicense.count', -1) do
      delete :destroy, id: @driving_license
    end

    assert_redirected_to driving_licenses_path
  end
end
