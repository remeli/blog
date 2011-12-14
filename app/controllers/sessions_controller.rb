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
      redirect_to root_path, :notice => "Вы успешно вошли"
    else
      flash.now.alert = 'Не верный пароль или email'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Вы успешно вышли"
  end
  
end
