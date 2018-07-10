class ApplicationController < ActionController::Base
	# This class is intended to be a superclass from which
# the other (end-user related) controller classes inherit
  #before_filter :authenticate_user!

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_type])
  end


end
