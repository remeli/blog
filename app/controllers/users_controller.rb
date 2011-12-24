#encoding:UTF-8
class UsersController < ApplicationController

  before_filter :ver_in_system, :only => [:new, :create]
  respond_to :html
  layout 'signup'
  
  def index
    @users = User.page(params[:page]).per(20)
    @title = "Все пользователи"
    render :layout => 'application'
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(10)
    @title = "Блог пользователя: #{username(@user)}"
    render :layout => 'application'
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
  
  def settings
    @user = User.find(params[:id])
    @title = "Настройки"
    render :layout => 'application'
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Вы успешно обновили настройки"
      respond_with(@user, :location => root_path)
    else
      render 'settings', :layout => 'application'
    end
  end
end
