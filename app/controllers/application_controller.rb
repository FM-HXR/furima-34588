class ApplicationController < ActionController::Base
  before_action :config_permitted_params, if: :devise_controller?
  # before_action :authenticate_user!
  before_action :find_user
  before_action :basic_auth

  def find_user
    @user = current_user
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def config_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :surname, :name, :surname_furigana, :name_furigana, :date_of_birth])
  end
end
