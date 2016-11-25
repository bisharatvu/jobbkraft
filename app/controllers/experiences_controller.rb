class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  # GET /experiences
  # GET /experiences.json
  def index
    @experiences = Experience.all
  end

  # GET /experiences/1
  # GET /experiences/1.json
  def show
  end

  # GET /experiences/new
  def new
    @experience = Experience.new
  end

  # GET /experiences/1/edit
  def edit
    @user = current_user
    respond_to do |format|
        format.js
        format.html
    end
  end

  # POST /experiences
  # POST /experiences.json
  def create
      @user = current_user
      if @user.experiences.count == 0
          @user.user_profile_progress += 10
      end
    @experience = current_user.experiences.new(experience_params)

    respond_to do |format|
      if @experience.save!
          @user.save!
          format.html { redirect_to '/profile#addMoreExperiences', notice: t('experiences_controller.experiences_create_success') }
          format.json { render :show, status: :created, location: @experience }
          format.js
      else
        format.html { render :new }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experiences/1
  # PATCH/PUT /experiences/1.json
  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to '/profile#addMoreExperiences', notice: t('experiences_controller.experiences_update_success') }
        format.json { render :show, status: :ok, location: @experience }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
      @user = current_user
      if @user.experiences.count == 1
          @user.user_profile_progress -= 10
      end
      @experience.destroy
      @user.save!
    respond_to do |format|
      format.html { redirect_to '/profile#addMoreExperiences', notice: t('experiences_controller.experiences_delete_success') }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      params.require(:experience).permit(:experience_company_name, :experience_title, :experience_date_from, :experience_date_to, :experience_i_am_work_here, :experience_branch, :experience_description, :user_id)
    end
end
