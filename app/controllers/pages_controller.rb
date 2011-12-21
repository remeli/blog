#encoding: UTF-8

class PagesController < ApplicationController
  
  def index
    @pages = Page.page(params[:page]).per(7)
  end
  
  def show
    if params[:permalink]
      @page = Page.find_by_permalink(params[:permalink])
      raise ActiveRecord::RecordNotFound, "Страница не найдена" if @page.nil?
    else
      @page = Page.find(params[:id])
    end
  end
  
end
