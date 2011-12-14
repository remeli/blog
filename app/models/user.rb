#encoding:UTF-8
class User < ActiveRecord::Base
  attr_accessor :password
  validates :password, :confirmation => true
  validates :password, :presence => true, :on => :create
  validates :email, :presence => true
  valudates :email, :uniqueness => true
end