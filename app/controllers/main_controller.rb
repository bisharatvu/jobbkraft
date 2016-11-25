class MainController < ApplicationController
    skip_before_filter :authenticate_user!, :except => [:company_home, :worker_home]
    layout "myApplication", only: [:home, :company]
    def home
        $is_company = false
        @skip_header = true
        @skip_sidebar = true
        @skip_static_footer = true
        check_and_redirect_user
    end

    def company
        $is_company = true
        @skip_header = true
        @skip_sidebar = true
        @skip_static_footer = true
        check_and_redirect_user
    end
    def company_home
        $lmc_left_menu = 'lmc_overview'
        $lmc_subleft_menu = ''
        if !current_user.is_company
            redirect_to worker_home_path
        end
        @user = current_user
    end
    def worker_home
        $lmc_left_menu = 'lmw_overview'
        $lmc_subleft_menu = ''
        if current_user.is_company
            redirect_to company_home_path
        end
        @user = current_user
    end
    def worker_all_jobs
        $lmc_left_menu = 'lmw_all_jobs'
        $lmc_subleft_menu = 'lmw_all_jobs'
        @user = current_user
        @jobs = Job.all.text_search(params[:query], params[:town], params[:status]).order('jobs.created_at DESC')
    end

    def check_and_redirect_user
        if current_user
            redirect_to after_sign_in_path_for(current_user)
        end
    end
end
