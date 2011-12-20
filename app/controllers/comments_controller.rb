#encoding: UTF-8

class CommentsController < ApplicationController
  
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
  
end

# todo сделать rest в роутах