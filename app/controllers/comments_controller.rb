#encoding: UTF-8

class CommentsController < ApplicationController
  
  before_filter :find_post
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to :back
    else
      render :action => 'new'
    end
  end
  
  def index
    @comments = @post.comments
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end
  
  private
  
  def find_post
    @post = Post.find(params[:post_id])
  end
  
end
