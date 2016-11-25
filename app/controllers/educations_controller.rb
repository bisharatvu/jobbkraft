class EducationsController < ApplicationController
  before_action :set_education, only: [:show, :edit, :update, :destroy]

  # GET /educations
  # GET /educations.json
  def index
    @educations = Education.all
  end

  # GET /educations/1
  # GET /educations/1.json
  def show
  end

  # GET /educations/new
  def new
    @education = Education.new
  end

  # GET /educations/1/edit
  def edit
      @user = current_user
  end

  # POST /educations
  # POST /educations.json
  def create
    @user = current_user
    if @user.educations.count == 0
       @user.user_profile_progress += 10
    end
    @education = current_user.educations.new(education_params)

    respond_to do |format|
      if @education.save!
          @user.save!
        format.html { redirect_to '/profile#addMoreEducations', notice: t('educations_controller.educations_create_success') }
        format.json { render :show, status: :created, location: @education }
        format.js
      else
        format.html { render :new }
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /educations/1
  # PATCH/PUT /educations/1.json
  def update
    respond_to do |format|
      if @education.update(education_params)
        format.html { redirect_to '/profile#addMoreEducations', notice: t('educations_controller.educations_update_success') }
        format.json { render :show, status: :ok, location: @education }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /educations/1
  # DELETE /educations/1.json
  def destroy
      @user = current_user
      if @user.educations.count == 1
          @user.user_profile_progress -= 10
      end
      @education.destroy
      @user.save!
      respond_to do |format|
      format.html { redirect_to '/profile#addMoreEducations', notice: t('educations_controller.educations_delete_success') }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education
      @education = Education.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_params
      params.require(:education).permit(:education_title, :education_school_name, :education_date_from, :education_date_to, :education_description, :user_id)
    end
end
