class UserProfileController < ApplicationController

    def index
      $lmc_left_menu = 'settings'
      $lmc_subleft_menu = 'profile_setting'
      @skip_static_footer = true

      @user = current_user
      @user_educations = current_user.educations.order('education_date_from DESC')
      @user_experiences = current_user.experiences.all.order('experience_date_to DESC NULLS FIRST')
      @user_certificates = current_user.certificates.all.order('certificate_publish_date DESC')
      @user_languages = current_user.languages.all
      @driving_license = current_user.driving_license
      @user_competences = current_user.user_competences.all
      @user_hobbies = current_user.hobbies.all
      @user_job_category = current_user.user_job_category
      @user_job_type = current_user.user_job_type
      @language = Language.new
      @update_account = @user
      gon.aboutMeText = @user.about_me
      gon.user = @user
      gon.userJobCategory = @user_job_category
      gon.userJobType = @user_job_type
      gon.video_url = @user.video_url.url

    end
    def account
        @user = current_user
        @update_account = @user
        $lmc_left_menu = 'settings'
        $lmc_subleft_menu = 'account_setting'
    end
    def update_account_info
      @user = current_user
      respond_to do |format|
        if @user.update(update_account_params)
          @user.user_account_progress = 100
          @user.save!
          format.html { redirect_to root_path, notice: t('user_profile_controller.user_profile_account_information_success') }
          format.json { render :show, status: :ok, location: @job }
          format.js
        else
          format.html { render account_path }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    end

    def update_other_profile_info
        @user = current_user
        @user_job_type
        @user_job_category
        if !@user.user_job_category
          @user_job_category = UserJobCategory.create(user_id: @user.id)
        else
          @user_job_category = @user.user_job_category
        end
        if !@user.user_job_type
          @user_job_type = UserJobType.create(user_id: @user.id)
        else
          @user_job_type = @user.user_job_type
        end
        respond_to do |format|
          if @user.update(update_other_profile_params) && @user_job_category.update(update_job_category_params) &&
              @user_job_type.update(update_job_type_params)

            format.html { redirect_to root_path, notice: t('user_profile_controller.user_profile_account_information_success') }
            format.json { render :show, status: :ok, location: @job }
            format.js
          else
            format.html { render account_path }
            format.json { render json: @job.errors, status: :unprocessable_entity }
          end
        end
    end
    def add_profile_image
        @user = current_user
        if !@user.image_url.url
            @user.user_profile_progress += 10
        end
        @user.image_url = params[:image_uploading_form][:image_url]
        if @user.save
            format.html { redirect_to profile_path, notice: t('user_profile_controller.user_profile_add_profile_image_success') }
            format.json { render :show, status: :created, location: @job }
        end



        render text: @user.image_url.url
    end
    def  edit_user_name
        @user = current_user
        if !@user.user_name
            @user.user_profile_progress += 10
        end
        @user.user_name = params[:edit_user_name_form][:user_name]
        @user.save!
        respond_to do |format|
            if @user.save
                format.html { redirect_to profile_path, notice: t('user_profile_controller.user_profile_edit_user_name_success') }
                format.json { render :show, status: :created, location: @job }
            else
                format.html { render :new }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end        #render text: @user.user_name

    end
    def  edit_about_me_text
        @user = current_user

        if !@user.about_me
          @user.user_profile_progress += 10
        end
        @user.about_me = params[:user][:about_me]
        @user.save!
        respond_to do |format|
            if @user.save
                format.html { redirect_to profile_path, notice: t('user_profile_controller.user_profile_edit_about_me_text_success') }
                format.json { render :show, status: :created, location: @job }
                format.js
            else
                format.html { render :new }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end        #render text: @user.about_me

    end
    def  add_profile_video
        @user = current_user
        if !@user.video_url.url
          @user.user_profile_progress += 10
        end
        @user.video_url = params[:video_uploading_form][:video_url]
        @user.save!
        respond_to do |format|
            if @user.save
                format.html { redirect_to profile_path, notice: t('user_profile_controller.user_profile_add_profile_video_success') }
                format.json { redirect_to profile_path, notice:  t('user_profile_controller.user_profile_add_profile_video_success') }
            else
                format.html { render :new }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end        #render text: @user.video_url

    end


    def driving_license_display
        redirect_to '/profile#addMoreDrivingLicenses', notice: t('user_profile_controller.user_profile_driving_license_display_success')

    end
    def update_account_params
        params.require(:user).permit(:user_address_street, :user_address_zip, :user_address_city, :user_bank_account_no,
                                     :user_cell_phone, :user_phone_no, :user_first_name, :user_last_name, :user_gender,
                                     :user_freelancer_company, :user_company_number, :user_company_name,
                                     :user_personal_number)
    end
    def update_other_profile_params
        params.require(:user_profile).permit(:user_freelancer_company, :user_company_number, :user_company_name)
    end
    def update_job_category_params
        params.require(:user_profile).permit(:administrative, :brand_ambassador, :customer_service, :data_entry, :delivery,
                                     :event_staff, :warehousing, :general_labor, :market_research, :marketing,
                                     :merchandising, :sales, :software_testing, :volunteer, :washing, :other)
    end
    def update_job_type_params
        params.require(:user_profile).permit(:consultant, :hire)
    end
end
