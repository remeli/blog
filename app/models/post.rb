#encoding:UTF-8
class Post < ActiveRecord::Base
belongs_to :category
belongs_to :user
validates :title, :description, :presence=>true
validates :title, :uniqueness=>true, :length =>{ :within => 2..25 } 
end
