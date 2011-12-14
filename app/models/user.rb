#encoding:UTF-8
class User < ActiveRecord::Base
  # == Schema Information
  #
  # Table name: users
  #
  #  id            :integer         not null, primary key
  #  email         :string(255)
  #  password_hash :string(255)
  #  password_salt :string(255)
  #  created_at    :datetime
  #  updated_at    :datetime
  #
  
  attr_accessor :password
  validates :password, :confirmation => true
  validates :password, :presence => true, :on => :create
  validates :email, :presence => true
  valudates :email, :uniqueness => true
end