class CallbacksController < Devise::OmniauthCallbacksController
    def facebook
        @user = UserProvider.find_for_oauth(request.env["omniauth.auth"])

        if @user.persisted?
            sign_in_and_redirect @user, :event => :authentication
        else
            session["devise.facebook_data"] = request.env["omniauth.auth"]
            redirect_to new_user_registration_url
        end
    end

    def linkedin
        auth = env["omniauth.auth"]

        @user = UserProvider.find_for_oauth(request.env["omniauth.auth"])
        if @user.persisted?
            sign_in_and_redirect @user, :event => :authentication
        else
            session["devise.linkedin_uid"] = request.env["omniauth.auth"]
            redirect_to new_user_registration_url
        end
    end

=begin
    def facebook
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user.save
            sign_in_and_redirect @user
        else
            respond_to do |format|
                format.html { redirect_to root_path, notice: 'User with this email already exists.' }
            end
        end
    end


    def linkedin
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user.save
        sign_in_and_redirect @user
        else
            respond_to do |format|
             format.html { redirect_to root_path, notice: 'User with this email already exists.' }
            end
        end
    end
=end
end