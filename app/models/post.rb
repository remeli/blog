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
  default_scope order('created_at DESC')
  
  # validates:
  validates :title, :presence => { :message => 'Название не может быть пустым' }
  validates :title, :length => { :minimum => 2, :message => 'Название короткое' } 
  validates :description, :presence => { :message => 'Пост не может быть пустым'  }
  validates :category_id, :presence => { :message => 'Категория не выбрана' }
  
  def button_value
    if new_record?
      "Добавить пост"
    else
      "Редактировать пост"
    end
  end
  
end

