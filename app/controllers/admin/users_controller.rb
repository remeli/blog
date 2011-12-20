# encoding:UTF-8

class Admin::UsersController < ApplicationController
  
  layout 'admin'
  before_filter :access
  respond_to :html
  
  def index
    @users = User.all
    respond_with @users
  end
  
  def edit
    @user = User.find(params[:id])
    respond_with @user
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Пользователь успешно обновлен"
      respond_with(@user, :location => admin_users_path)
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Пользователь успешно обновлен"
    redirect_to admin_users_path
  end
end