#encoding: UTF-8
class CategoriesController < ApplicationController
  
  respond_to :html
  
  def index
    @categories = Category.all
    respond_with @categories
  end
  
  def show
    @category = Category.find(params[:id])
    respond_with @category
    # TODO: переделать
    @posts = @category.posts
  end
  
end
