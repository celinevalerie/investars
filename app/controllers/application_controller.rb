class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :user_path, only: [:create], if: :devise_controller?

  def user_path
    redirect_to user_path(@user)
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :name, :description, :industry, :photo])
  end
end
