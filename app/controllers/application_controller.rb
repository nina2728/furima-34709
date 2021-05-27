class ApplicationController < ActionController::Base
  before_action :basic_authx
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_authx
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTHX_USER'] && password == ENV['BASIC_AUTHX_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :lastname_kanji, :firstname_kanji, :lastname_kana, :firstname_kana,
                                             :date_of_birth])
  end
end
