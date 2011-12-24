# encoding:UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :load_variables, :load_buzz
  
  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def load_variables
      @menu_pages = Page.menu
    end
    
    def load_buzz
      @last_comments = Comment.buzz
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
    
    # if user in system
    def ver_in_system
      if current_user
        redirect_to(root_path, :notice => "Вы уже в системе")
      end
    end
    
    def username(object)
      object.nickname ? object.nickname : object.email
    end
    
end