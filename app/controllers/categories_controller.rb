#encoding: UTF-8
class CategoriesController < ApplicationController
  respond_to :html
  
  def index
    @categories = Category.all
    respond_with @categories
  end
  
  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.page(params[:page]).per(5)
    respond_with @categories
  end
  
end
