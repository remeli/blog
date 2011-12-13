#encoding:UTF-8
class Post < ActiveRecord::Base
belongs_to :category
validates :title, :description, :presence=>true
validates :title, :uniqueness=>true, :length =>{ :within => 2..25 } 
end
