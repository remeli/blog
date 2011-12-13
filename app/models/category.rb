class Category < ActiveRecord::Base
  has_many :posts
  validates :name, :presence => true, :length => {:minimum => 3, :maximum => 140}
end
