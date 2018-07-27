class ApplicationController < ActionController::Base
	include Pundit
	# This class is intended to be a superclass from which
# the other (end-user related) controller classes inherit
  #before_filter :authenticate_user!
  #pundit rescue for authorized users

   # config.action_dispatch.rescue_responses["Pundit::NotAuthorizedError"] = :forbidden


    before_action :authenticate_user!
    # after_action :verify_authorized, unless: :devise_controller
    #after_action :verify_authorized, except: :index
    before_action :configure_permitted_parameters, if: :devise_controller?
    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_type])
    puts 'xx'
    end 

    #this method is pundit builten method for user authorizations
    private

   

end
