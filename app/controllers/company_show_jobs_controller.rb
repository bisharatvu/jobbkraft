class CompanyShowJobsController < ApplicationController

    def my_review_jobs
        $lmc_left_menu = 'lmc_my_jobs'
        $lmc_subleft_menu = 'lmc_my_review_jobs'
        @user = current_user
        @my_review_jobs = Job.all.where(job_status: 'review').text_search(params[:query], params[:town], params[:status]).order('jobs.created_at DESC')
    end

end
