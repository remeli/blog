#encoding: UTF-8

class Comment < ActiveRecord::Base
  # == Schema Information
  #
  # Table name: comments
  #
  #  id           :integer         not null, primary key
  #  user_id      :integer
  #  post_id      :integer
  #  comment_text :text
  #  created_at   :datetime
  #  updated_at   :datetime
  #
  
  belongs_to :user
  belongs_to :post
  validates :comment_text, :presence => true, 
                           :length =>{ :within => 2..200 }
end

