# encoding:UTF-8
class Admin::CategoriesController < ApplicationController
  
  respond_to :html
  before_filter :authorize, :only => [:new, :create, :edit, :update, :destroy]
  
  def index
    @categories = Category.all
    respond_with @categories
  end
  
  def new
    @category = Category.new
    respond_with @category
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Категория успешно добавлена"
      respond_with(@category, :location => root_path)
    else
      render 'new'
    end
  end

  
  def edit
    @category = Category.find(params[:id])
    respond_with(@category)
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = "Категория успешно обновлена"
      respond_with(@category, :location => @category)
    else
      render 'edit'
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
  end
end
