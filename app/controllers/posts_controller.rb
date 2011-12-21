#encoding:UTF-8
class PostsController < ApplicationController
  
  before_filter :authorize, :only => [:new, :create, :edit, :update, :destroy]
  before_filter :load_user, :only => [:new, :create]
  respond_to :html
  
  def index
    @posts = Post.page(params[:page]).per(5)
    @title = "Посты"
    respond_with @posts
  end
    
  def show
    @comment = Comment.new
    @post = Post.find(params[:id])
    @title = @post.title
    respond_with @post
  end
  
  def new
    @post = @user.post.new
    @title = "Добавление поста"
    respond_with @post
  end
  
  def edit
    @post = Post.find(params[:id])
    respond_with @post
  end
  
  def create
    @post = @user.post.new(params[:post])
    if @post.save
      flash[:notice] = 'Пост успешно добавлен'
      respond_with(@post, :location => root_path)
    else
      render 'new'
    end    
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = 'Пост успешно обновлен'
      respond_with(@post, :location => @post)
    else
      render 'edit'
    end    
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end
  
  private
  
  def load_user
    @user = current_user
  end

end
