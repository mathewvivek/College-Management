class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
    def access_control
      if staff_signed_in? 
        true 
      else 
        redirect_to root_path, :notice => "You are not authorized to perform this task"
      end
    end
end
