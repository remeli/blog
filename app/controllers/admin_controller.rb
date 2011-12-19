# encoding:UTF-8
class AdminController < ApplicationController
  before_filter :authorize, :only => :index
  layout 'admin'
  
  def index
    
  end
end