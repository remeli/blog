class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to category_path(@category), :notice => "Категория добавлена"
    else
      render :action => 'new', :notice => "Произошла ошибка. Проверьте правильность заполненных полей."
    end
  end
  
  def show
    @category = Category.find(params[:id])
    @posts = @category.posts
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to category_path(@category), :notice => "Категория обновлена"
    else
      render :action => 'edit', :notice => "Произошла ошибка"
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end
  
end
