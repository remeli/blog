# encoding:UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
  protected
  
    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to(log_in_path, :notice => "Пожалуйста авторизируйтесь")
      end
    end
    
    # the method verifies the user is an admin or not
    def access
      if current_user
        unless User.verify_access(current_user)
          redirect_to(root_path, :notice => "Действия запрещены")
        end        
      else
        redirect_to(log_in_path, :notice => "Пожалуйста авторизируйтесь")
      end

    end
    
end