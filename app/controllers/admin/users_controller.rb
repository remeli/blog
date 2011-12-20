# encoding:UTF-8

class Admin::UsersController < ApplicationController
  
  layout 'admin'
  before_filter :access
  
  def index
    
  end
  
end