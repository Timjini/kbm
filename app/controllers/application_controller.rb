class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected   

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [
            :first_name,
            :last_name,
            :user_name,
            :phone_number,
            :address,
            :city,
            :country,
            :avatar,
            ])
        devise_parameter_sanitizer.permit(:account_update, keys: [
            :first_name,
            :last_name,
            :user_name,
            :phone_number,
            :address,
            :city,
            :country,
            :role,
            :avatar
            ])
    end

    # def after_sign_in_path_for(resource)
    #     if resource.role == "admin"
    #         admin_dashboard_path
    #     else
    #         root_path
    #     end
    # end

    def after_sign_out_path_for(resource)
        root_path
    end
end
