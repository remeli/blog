#encoding:UTF-8
class PostsController < ApplicationController

  respond_to :html
  
  def index
    @posts = Post.all
    respond_with @posts
  end
  
  def show
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
      flash[:notice] = "Пост успешно добавлен"
      respond_with(@post, :location => root_path)
    else
      render 'new'
    end    
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Пост успешно обновлен"
      respond_with(@post, :location => @post)
    else
      render 'edit'
    end    
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

end
