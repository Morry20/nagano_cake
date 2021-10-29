class ApplicationController < ActionController::Base
   
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private

    #sin up時の登録情報追加
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number])
    end
   
   
end
