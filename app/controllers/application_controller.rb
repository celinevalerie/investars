class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :name, :description, :industry, :photo, :url, :address, :latitude, :longitude])
  end

  private

  def after_new_user_registration_path_for(resource)
    "/users/#{current_user.id}"
  end
end
