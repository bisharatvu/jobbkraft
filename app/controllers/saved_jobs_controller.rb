class SavedJobsController < ApplicationController
  before_action :set_saved_job, only: [:show, :edit, :update, :destroy]

  # GET /saved_jobs
  # GET /saved_jobs.json
  def index
      $lmc_left_menu = "lmw_all_jobs"
      $lmc_subleft_menu = "lmw_saved_jobs"
      @user = current_user
      @saved_jobs_ids = current_user.saved_jobs.pluck(:job_id)
      @saved_jobs = Job.where(id: @saved_jobs_ids).text_search(params[:query], params[:town], params[:status])
  end

  # GET /saved_jobs/1
  # GET /saved_jobs/1.json
  def show
  end

  # GET /saved_jobs/new
  def new
    @saved_job = SavedJob.new
  end

  # GET /saved_jobs/1/edit
  def edit
  end

  # POST /saved_jobs
  # POST /saved_jobs.json
  def create
      if current_user.saved_jobs.where(job_id: params[:saved_job][:job_id]).count > 0
          respond_to do |format|
                  format.html { redirect_to worker_all_jobs_path, notice: t('saved_jobs_controller.saved_jobs_create_error') }
          end
      else
          @saved_job = current_user.saved_jobs.new(saved_job_params)

          respond_to do |format|
              if @saved_job.save
                  format.html { redirect_to worker_all_jobs_path, notice: t('saved_jobs_controller.saved_jobs_create_success') }
                  format.json { render :show, status: :created, location: @saved_job }

              else
                  format.html { render :new }
                  format.json { render json: @saved_job.errors, status: :unprocessable_entity }
              end
          end
      end
  end

  # PATCH/PUT /saved_jobs/1
  # PATCH/PUT /saved_jobs/1.json
  def update
    respond_to do |format|
      if @saved_job.update(saved_job_params)
        format.html { redirect_to @saved_job, notice: t('saved_jobs_controller.saved_jobs_update_success') }
        format.json { render :show, status: :ok, location: @saved_job }
      else
        format.html { render :edit }
        format.json { render json: @saved_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_jobs/1
  # DELETE /saved_jobs/1.json
  def destroy
    @saved_job.destroy
    respond_to do |format|
      format.html { redirect_to saved_jobs_url, notice: t('saved_jobs_controller.saved_jobs_delete_success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saved_job
      @saved_job = SavedJob.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saved_job_params
      params.require(:saved_job).permit(:job_id, :user_id)
    end
end
