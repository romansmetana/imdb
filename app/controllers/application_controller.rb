# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:nickname, :email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:nickname, :email, :current_password) }
  end
end
