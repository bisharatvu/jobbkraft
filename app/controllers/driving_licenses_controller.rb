class DrivingLicensesController < ApplicationController
  before_action :set_driving_license, only: [:show, :edit, :update, :destroy]

  # GET /driving_licenses
  # GET /driving_licenses.json
  def index
    @driving_licenses = DrivingLicense.all
  end

  # GET /driving_licenses/1
  # GET /driving_licenses/1.json
  def show
  end

  # GET /driving_licenses/new
  def new
    @driving_license = DrivingLicense.new
  end

  # GET /driving_licenses/1/edit
  def edit
    @user = current_user
  end

  # POST /driving_licenses
  # POST /driving_licenses.json
  def create
    @user = current_user
    if @user.driving_license == 0
      @driving_license = @user.driving_license.new(driving_license_params)
    else
      @driving_license.update(driving_license_params)
    end
    respond_to do |format|
      if @driving_license.save
        format.html { redirect_to '/profile#addMoreDrivingLicenses', notice: t('driving_licenses_controller.driving_licenses_create_success') }
        format.json { render :show, status: :created, location: @driving_license }
      else
        format.html { render :new }
        format.json { render json: @driving_license.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /driving_licenses/1
  # PATCH/PUT /driving_licenses/1.json
  def update
    @user = current_user
    if @user.driving_license == 0
      @driving_license = @user.driving_license.new(driving_license_params)
    else
      @driving_license.update(driving_license_params)
    end
    respond_to do |format|
      if @driving_license.save
        format.html { redirect_to '/profile#addMoreDrivingLicenses', notice: t('driving_licenses_controller.driving_licenses_update_success') }
        format.json { render :show, status: :ok, location: @driving_license }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @driving_license.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /driving_licenses/1
  # DELETE /driving_licenses/1.json
  def destroy
    @driving_license.destroy
    respond_to do |format|
      format.html { redirect_to driving_licenses_url, notice: 'Driving license was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driving_license
      @driving_license = DrivingLicense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driving_license_params
      params.require(:driving_license).permit(:dl_am, :dl_aa, :dl_a2, :dl_a, :dl_b, :dl_be, :dl_c, :dl_c1, :dl_ce, :dl_c1e, :dl_d, :dl_d1, :dl_de, :dl_d1e, :user_id)
    end
end
