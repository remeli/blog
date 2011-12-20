#encoding:UTF-8
class Admin::PostsController < ApplicationController
  
  layout 'admin'  
  respond_to :html
  before_filter :access    
  
  def index
    @posts = Post.all
    respond_with @posts
  end
  
  def show
    @comment = Comment.new
    @post = Post.find(params[:id])
    respond_with @post
  end
  
  def new
    @post = Post.new
    respond_with @post
  end
  
  def edit
    @post = Post.find(params[:id])
    respond_with @post
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = 'Пост успешно добавлен'
      respond_with(@post, :location => admin_posts_path)
    else
      render 'new'
    end    
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = 'Пост успешно обновлен'
      respond_with(@post, :location => admin_posts_path)
    else
      render 'edit'
    end    
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Пост успешно удален"
    redirect_to admin_posts_path
  end

end
