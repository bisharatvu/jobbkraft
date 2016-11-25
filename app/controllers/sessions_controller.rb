class SessionsController < Devise::SessionsController
    layout "myApplication"
###################################
=begin
    def create
        resource = warden.authenticate!(:scope => resource_name, :recall => '#{controller_path}#failure')
        sign_in_and_redirect(resource_name, resource)
    end

    def sign_in_and_redirect(resource_or_scope, resource=nil)
        scope = Devise::Mapping.find_scope!(resource_or_scope)
        resource ||= resource_or_scope
        sign_in(scope, resource) unless warden.user(scope) == resource
        return render :json => {:success => true}
    end

    def failure
        return render :json => {:success => false, :errors => ["Login failed."]}
    end
=end
###########################

    respond_to :json

    def create
        session['user_auth'] = params[:user]
        resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")

        sign_in(resource_name, resource)
        message = I18n.t 'devise.sessions.signed_in'
        yield resource if block_given?

        if request.xhr?
            return render :json => {:success => true, :login => true, :data =>  {:message => message}, location: after_sign_in_path_for(resource)}

        else
            respond_with resource, location: after_sign_in_path_for(resource)
        end
    end

    def failure
        user = User.where(email: session['user_auth'][:email]).first rescue nil
        message = I18n.t 'devise.failure.invalid', authentication_keys: "email"

        respond_to do |format|
            format.json {
                render :json => {:success => false, :data => {:message => message, :cause => 'invalid'} }
            }
            format.html {
                redirect_to '/users/sign_in'
            }
        end
    end
end