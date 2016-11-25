class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  #layout "myApplication", only: [:show]
  before_filter :authenticate_company , except: [:show]

  # GET /jobs
  # GET /jobs.json
  def index
      @user = current_user
      @job = Job.new

      @jobs = current_user.jobs.text_search(params[:query], params[:town], params[:status])
      $lmc_left_menu = 'lmc_my_jobs'
      $lmc_subleft_menu = 'lmc_all_jobs'

  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
      @user = current_user
      @skip_footer_for_home = true
      @user = current_user

      @job_questions = Job.find(params[:id]).extra_questions
      @answer = []
      @job_questions.count.times do
          @answer << Answer.new
      end

  end

  # GET /jobs/new
  def new
    @job = Job.new
    @user = current_user
    $lmc_left_menu = 'lmc_new_job'
    $lmc_subleft_menu = ''
    @user_companies = current_user.companies.all
    gon.my_companies = @user_companies

    @prices = Price.where(company_id: @user.companies)
    gon.prices = @prices

  end

  # GET /jobs/1/edit
  def edit
    @user = current_user
    @user_companies = current_user.companies.all
    gon.my_companies = @user_companies
  end

  # POST /jobs
  # POST /jobs.json
  def create
    if current_user.companies.where(is_active: true).count>0
    @company = current_user.companies.where(is_active: true).first
    @job = Job.create(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to jobs_path, notice: t('jobs_controller.jobs_create_success') }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
    else
        redirect_to companies_path, alert: t('jobs_controller.jobs_create_error')
     end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to jobs_path, notice: t('jobs_controller.jobs_update_success') }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: t('jobs_controller.jobs_delete_success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:job_name, :job_discription, :job_hire_type, :job_last_date_to_apply,
                                  :job_place_city, :job_place_town, :job_status, :job_type, :job_category,
                                  :job_tasks, :job_workers_needed, :job_hire_in_house, :job_gfl, :job_company_index,
                                  :job_company_description, :job_company_address, :job_company_address_zip,
                                  :job_company_address_city, :job_consultant_type, :job_start_time,
                                  :job_consultant_duration, :job_consultant_repeat_type, :job_consultant_repeat_days,
                                  :job_price_per_hour, :job_total_cost_per_person, :company_id, :accept_agreement,
                                  extra_questions_attributes: [:id, :job_question, :_destroy],
                                  job_requirements_attributes: [:id, :requirement_name, :_destroy])
    end



end
