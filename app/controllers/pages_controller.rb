#encoding: UTF-8

class PagesController < ApplicationController
  
  respond_to :html
  
  def index
    @pages = Page.all
    @title = "Страницы"
  end
  
  def show
    if params[:permalink]
      @page = Page.find_by_permalink(params[:permalink])
      raise ActiveRecord::RecordNotFound, "Страница не найдена" if @page.nil?
    else
      @page = Page.find(params[:id])
      @title = @page.name
      respond_with @page
    end
  end
  
end
