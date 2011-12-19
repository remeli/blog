#encoding: UTF-8

class Category < ActiveRecord::Base
  # == Schema Information
  #
  # Table name: categories
  #
  #  id         :integer         not null, primary key
  #  name       :string(255)
  #  created_at :datetime
  #  updated_at :datetime
  #

  has_many :posts, :dependent => :destroy
  validates :name, :presence => true, :length => {:minimum => 3, :maximum => 140}
  
  def self.ascname
    order("categories.name ASC")
  end
end
