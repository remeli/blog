#encoding:UTF-8
class PostsController < ApplicationController
  
  before_filter :authorize, :only => [:new, :create, :edit, :update, :destroy]
  before_filter :load_user, :only => [:new, :create]
  before_filter :ver_edit, :only => [:edit, :update, :destroy]
  respond_to :html
  
  def index
    @posts = Post.page(params[:page]).per(5)
    @title = "Посты"
    respond_with @posts
  end
    
  def show
    @comment = Comment.new
    find_post
    @title = @post.title
    respond_with @post
  end
  
  def new
    @post = @user.posts.new
    @title = "Добавление поста"
    respond_with @post
  end
  
  def edit
    find_post
    respond_with @post
  end
  
  def create
    @post = @user.posts.new(params[:post])
    if @post.save
      flash[:notice] = 'Пост успешно добавлен'
      respond_with(@post, :location => root_path)
    else
      render 'new'
    end    
  end
  
  def update
    find_post
    if @post.update_attributes(params[:post])
      flash[:notice] = 'Пост успешно обновлен'
      respond_with(@post, :location => @post)
    else
      render 'edit'
    end    
  end
  
  def destroy
    find_post
    @post.destroy
  end
  
  private
  
  def load_user
    @user = current_user
  end
  
  def ver_edit
    find_post
    if current_user.id == @post.user.id
      true
    else
      redirect_to current_user, :notice => "Действия запрещены!"
    end
  end
  
  def find_post
    @post = Post.find(params[:id])
  end
  
end
