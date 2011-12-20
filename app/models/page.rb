#encoding: UTF-8
class Page < ActiveRecord::Base
  # == Schema Information
  #
  # Table name: pages
  #
  #  id         :integer         not null, primary key
  #  name       :string(255)
  #  permalink  :string(255)
  #  content    :text
  #  created_at :datetime
  #  updated_at :datetime
  #

  validates :name, :presence => {:message => "Пустое название"}
  validates :permalink, :presence => {:message => "Пустая прямая ссылка"}
  validates :permalink, :length => {:within => 3..20}
  validates :content, :presence => {:message => "Пустой контент"}
  
  default_scope order("name ASC")
  
end
