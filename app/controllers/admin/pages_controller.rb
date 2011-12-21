# encoding:UTF-8
class Admin::PagesController < ApplicationController

  before_filter :access
  layout 'admin'
  respond_to :html
  
  def index
    @pages = Page.page(params[:page]).per(7)
    respond_with(@pages)
  end
  
  def new
    @page = Page.new
    respond_with(@page)
  end
  
  def edit
    @page = Page.find(params[:id])
    respond_with(@page)
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = 'Страница успешно добавлена'
      respond_with(@page, :location => admin_pages_path)
    else
      render 'new'
    end
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = 'Страница успешно обновлена'
      respond_with(@page, :location => admin_pages_path)
    else
      render 'edit'
    end
  end
  
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = 'Страница успешно удалена'
    redirect_to admin_pages_path
  end
  
end