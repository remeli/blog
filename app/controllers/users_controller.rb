#encoding:UTF-8
class UsersController < ApplicationController

  before_filter :ver_in_system
  respond_to :html
  layout 'signup'
  
  def index
    render :layout => 'application'
    @title = "Все пользователи"
  end
  
  def show
    UsersController.layout 'application'
  end
  
  def new
    @user = User.new
    @title = "Регистрация"
    respond_with(@user)
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Вы успешно зарегистрировались"
      session[:user_id] = @user.id
      respond_with(@user, :location => root_path)
    else
      render 'new'
    end
  end
end
