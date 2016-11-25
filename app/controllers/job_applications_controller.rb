class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: [:show, :edit, :update, :destroy]
  layout "myApplication", only: [:show]

  # GET /job_applications
  # GET /job_applications.json
  def index
      $lmc_left_menu = "lmw_all_jobs"
      $lmc_subleft_menu = "lmw_job_applications"
    @user = current_user
    @job_applications_ids = current_user.job_applications.pluck(:job_id)
    @job_applications = Job.where(id: @job_applications_ids).text_search(params[:query], params[:town], params[:status])
  end

  # GET /job_applications/1
  # GET /job_applications/1.json
  def show

      @skip_footer_for_home = true

  end

  # GET /job_applications/new
  def new
    @job_application = JobApplication.new
  end

  # GET /job_applications/1/edit
  def edit
  end

  # POST /job_applications
  # POST /job_applications.json
  def create
      if current_user.job_applications.where(job_id: params[:job_application][:job_id]).count > 0
          respond_to do |format|
              format.html { redirect_to worker_all_jobs_path, notice: t('job_applications_controller.job_applications_create_error') }
          end
      else
          @job_application = current_user.job_applications.new(job_application_params)
            #Create EQ Answers
          if params.has_key?("answer")
              Answer.create(eq_answer_params(params["answer"]))
          else
              params["answers"].each do |answer|
                      Answer.create(eq_answer_params(answer))
              end
          end
            #Create EQ Answers end
          respond_to do |format|
              if @job_application.save
                @job = @job_application.job
                @job_owner = @job_application.job.users.first
                @applicant = current_user
                UserMailer.new_job_applicant_email(@job, @job_owner, @applicant ).deliver_now
                format.html { redirect_to worker_all_jobs_path, notice: t('job_applications_controller.job_applications_create_success') }
                  format.json { render :show, status: :created, location: @job_application }
              else
                  format.html { render :new }
                  format.json { render json: @job_application.errors, status: :unprocessable_entity }
              end
          end
      end

  end

  # PATCH/PUT /job_applications/1
  # PATCH/PUT /job_applications/1.json
  def update
    respond_to do |format|
      if @job_application.update(job_application_params)
        format.html { redirect_to @job_application, notice: t('job_applications_controller.job_applications_update_success') }
        format.json { render :show, status: :ok, location: @job_application }
      else
        format.html { render :edit }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_applications/1
  # DELETE /job_applications/1.json
  def destroy
    @job_application.destroy
    respond_to do |format|
      format.html { redirect_to job_applications_url, notice: t('job_applications_controller.job_applications_delete_success') }
      format.json { head :no_content }
    end
  end
  def applicants
      @user = current_user
      @job = Job.find(params[:job])
      @job_applications = @job.job_applications.includes(:user).all
      @job_applicants = @job.users.all
  end
  def applicant_profile
    @user = current_user
    @applicant = User.find(params[:id])
    $lmc_left_menu = 'settings'
    $lmc_subleft_menu = 'profile_setting'
    @user_educations = @applicant.educations.order('education_date_from DESC')
    @user_experiences = @applicant.experiences.all.order('experience_date_to DESC NULLS FIRST')
    @user_certificates = @applicant.certificates.all.order('certificate_publish_date DESC')
    @user_languages = @applicant.languages.all
    @driving_license = @applicant.driving_license
    @user_competences = @applicant.user_competences.all
    @user_hobbies = @applicant.hobbies.all
    @user_job_category = @applicant.user_job_category
    @user_job_type = @applicant.user_job_type
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_application
        @job_application = JobApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_application_params
      params.require(:job_application).permit(:apply_job_info, :price_per_hour, :job_id, :user_id)
    end
    def eq_answer_params(my_params)
        my_params.permit(:job_question_answer, :extra_question_id)
    end
end
