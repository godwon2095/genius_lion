class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token


  private
  def current_vue_user
    User.find(params[:q_user_id]) if params[:q_user_id].present?
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :gender, :birth])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :gender, :birth])
  end
end
