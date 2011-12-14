#encoding: UTF-8

class PagesController < ApplicationController
  
  def index
    @pages = Page.all
  end
  
  def show
    if params[:permalink]
      @page = Page.find_by_permalink(params[:permalink])
      raise ActiveRecord::RecordNotFound, "Страница не найдена" if @page.nil?
    else
      @page = Page.find(params[:id])
    end
  end
  
  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to page_path(@page), :notice => "Страница успешно создана"
    else
      render :action => 'new'
    end
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to page_path(@page), :notice => "Страница успешно обновлена"
    else  
      render :action => 'edit'
    end
  end
  
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_path, :notice => "Страница удалена"
  end
end
