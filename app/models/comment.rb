#encoding: UTF-8

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :comment_text, :presence => true, 
                           :length =>{ :within => 2..200 }
end
