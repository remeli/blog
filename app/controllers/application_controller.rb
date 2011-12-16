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
      unless User.find(session[:user_id])
        redirect_to log_in_path, :notice => "Пожалуйста авторизируйтесь"
      end
    end
end
