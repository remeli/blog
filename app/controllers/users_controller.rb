#encoding:UTF-8
class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(params[:user])
    if @user.save
      redirect_to root_path, :notice => "Вы успешно авторизовались"
    else
      render "new"
    end
  end
end
