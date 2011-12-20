# encoding:UTF-8

class Admin::UsersController < ApplicationController
  
  layout 'admin'
  before_filter :access
  respond_to :html
  
  def index
    @users = User.all
    respond_with(@users)
  end
  
end