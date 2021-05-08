class ApplicationController < ActionController::Base
    def signed_in_only!
        redirect_to new_user_session_path unless current_user
      end
    
      before_action :configure_permitted_parameters, if: :devise_controller?
    
      protected
    
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
      end
end
