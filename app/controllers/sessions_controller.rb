# encoding:UTF-8
class SessionsController < ApplicationController
  
  respond_to :html
  layout 'signup'
  
  def new
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = 'Вы успешно вошли'
      respond_with(:location => root_url)
    else
      flash.now.alert = 'Не верный пароль или email'
      render 'new'
    end
  end

end
