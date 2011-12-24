#encoding: UTF-8
class CategoriesController < ApplicationController
  respond_to :html
  
  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.page(params[:page]).per(5)
    @title = @category.name
    
    respond_with @categories
  end
  
end
