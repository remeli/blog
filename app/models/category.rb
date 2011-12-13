#encoding: UTF-8

class Category < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  validates :name, :presence => true, :length => {:minimum => 3, :maximum => 140}
end
