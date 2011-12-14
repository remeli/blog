#encoding:UTF-8
class Post < ActiveRecord::Base

  # == Schema Information
  #
  # Table name: posts
  #
  #  id          :integer         not null, primary key
  #  title       :string(255)
  #  description :text
  #  created_at  :datetime
  #  updated_at  :datetime
  #  category_id :integer
  #
  
  belongs_to :category
  validates :title, :description, :presence=>true
  validates :title, :uniqueness=>true, :length =>{ :within => 2..25 } 

end

