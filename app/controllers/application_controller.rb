class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :lastname_kanji, :firstname_kanji, :lastname_kana, :firstname_kana, :date_of_birth])
  end
end
