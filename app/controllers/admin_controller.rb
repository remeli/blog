# encoding:UTF-8
class AdminController < ApplicationController
  before_filter :authorize, :only => :index
  before_filter :access
  
  layout 'admin'
  
  def index
    
  end
end