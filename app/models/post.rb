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
  belongs_to :user
  has_many :comments, :dependent => :destroy
  validates :title, :description, :presence => true
  validates :title, :uniqueness => true, :length =>{ :within => 2..25 } 
  
  def button_value
    if new_record?
      "Добавить пост"
    else
      "Редактировать пост"
    end
  end

end

