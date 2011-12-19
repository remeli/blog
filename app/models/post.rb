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
  # validates :title, :description, :presence => 
  validates :title, :presence => { :message => 'Название не может быть пустым' }
  validates :title, :length => { :within => 2..25, :message => 'Название короткое' } 
  validates :description, :presence => {:message => 'Пост не может быть пустым'  }
  
  def button_value
    if new_record?
      "Добавить пост"
    else
      "Редактировать пост"
    end
  end

end

