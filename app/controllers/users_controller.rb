#encoding:UTF-8
class UsersController < ApplicationController
  
  respond_to :html
  layout 'signup'
  
  def new
    @user = User.new
    respond_with(@user)
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Вы успешно зарегистрировались"
      respond_with(@user, :location => root_path)
    else
      render 'new'
    end
  end
end
