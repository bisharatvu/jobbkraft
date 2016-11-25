class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :set_locale
  require 'fog'

  def set_locale
      I18n.locale = extract_locale_language_header
  end

  def after_sign_in_path_for(resource)
      if current_user.is_company
      company_home_path
      else
      worker_home_path
      end
  end
  def authenticate_worker
    if current_user.is_company
      redirect_to root_path , alert: 'Access denied'
    end
  end
  def authenticate_company
    if !current_user.is_company
      redirect_to root_path , alert: 'Access denied'
    end
  end

  protected
=begin
  def authenticate_user!
      if user_signed_in?
          super
      else
          redirect_to root_path, alert: 'You need to sign in or sign up before continuing.'
          ## if you want render 404 page
          ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
      end
  end
=end

  private
    def extract_locale_language_header
        case request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
            when 'sv'
                'sv'
            else
                'en'
        end
    end
end
