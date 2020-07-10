class ApplicationController < ActionController::Base

  private
    def check_admin
      if !admin_signed_in?
        redirect_to root_path, alert: 'You are not allowed to access this part of the site'
      end
    end
end
