#encoding:UTF-8

class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
  
  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find(params[:id])     
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to post_path(@post)
    else
      render :action=>'new',:notice=>'Ошибка!'
    end    
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to post_path(@post)
    else
      render :action=>'edit',:notice=>'Попробуйте еще раз!'   
    end    
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

end
