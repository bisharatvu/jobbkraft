class ApplicationMailer < ActionMailer::Base
    include Devise::Mailers::Helpers

    default from: 'Jobbkraft@Jobbkraft.herokuapp.com'
  layout 'mailer'

  def confirmation_instructions(record, token, opts={})
      @token = token
      devise_mail(record, :confirmation_instructions, opts)
  end

  def reset_password_instructions(record, token, opts={})
      @token = token
      devise_mail(record, :reset_password_instructions, opts)
  end

  def unlock_instructions(record, token, opts={})
      @token = token
      devise_mail(record, :unlock_instructions, opts)
  end


  def send_omniauth_password_email(user)
      @user = user
      @url  = 'http://example.com/login'
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

    def welcome_email(user)
      @user = user
      @url  = 'Jobbkraft.herokuapp.com'
      mail(to: @user.email, subject: 'Welcome to My Jobbkraft')
    end
    def new_job_applicant_email(job, job_owner, applicant)
      @job = job
      @job_owner = job_owner
      @applicant = applicant
      mail(to: @job_owner.email, subject: 'New Applicant')
    end
end
