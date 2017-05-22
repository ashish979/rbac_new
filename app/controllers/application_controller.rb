class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound do |_exception|
    render file: 'pages/error_404', layout: 'error', status: 404
  end

  rescue_from CanCan::AccessDenied do |exception|
    render file: 'pages/error_403', layout: 'error', status: 403
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :middle_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :middle_name, :last_name])
  end

end
