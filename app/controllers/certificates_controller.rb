class CertificatesController < ApplicationController
  before_action :set_certificate, only: [:show, :edit, :update, :destroy]

  # GET /certificates
  # GET /certificates.json
  def index
    @certificates = Certificate.all
  end

  # GET /certificates/1
  # GET /certificates/1.json
  def show
  end

  # GET /certificates/new
  def new
    @certificate = Certificate.new
  end

  # GET /certificates/1/edit
  def edit
    @user = current_user
  end

  # POST /certificates
  # POST /certificates.json
  def create
      @user = current_user
      if @user.certificates.count == 0
          @user.user_profile_progress += 10
      end
      @certificate = current_user.certificates.new(certificate_params)

    respond_to do |format|
      if @certificate.save!
          @user.save!
          format.html { redirect_to '/profile#addMoreCertificates', notice: t('certificates_controller.certificates_create_success') }
          format.json { render :show, status: :created, location: @certificate }
          format.js
      else
        format.html { render :new }
        format.json { render json: @certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /certificates/1
  # PATCH/PUT /certificates/1.json
  def update
    respond_to do |format|
      if @certificate.update(certificate_params)
        format.html { redirect_to '/profile#addMoreCertificates', notice: t('certificates_controller.certificates_update_success') }
        format.json { render :show, status: :ok, location: @certificate }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /certificates/1
  # DELETE /certificates/1.json
  def destroy
      @user = current_user
      if @user.certificates.count == 1
          @user.user_profile_progress -= 10
      end
    @certificate.destroy
    @user.save!
    respond_to do |format|
      format.html { redirect_to '/profile#addMoreCertificates', notice: t('certificates_controller.certificates_delete_success') }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certificate
      @certificate = Certificate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def certificate_params
      params.require(:certificate).permit(:certificate_name, :certificate_publisher, :certificate_publish_date, :certificate_description, :user_id)
    end
end
