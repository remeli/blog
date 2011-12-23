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
  attr_accessible :email, :password, :password_confirmation, :admin, :nickname, :avatar
  
  before_save :encrypt_password
  before_save :set_nickname
  
  has_many :comments, :dependent => :destroy
  has_many :posts
  
  validates :password, :confirmation => {:message => "Пароли не совпадают"}
  validates :password, :presence => {:message => "Пустой пароль"} , :on => :create
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => {:message => "Пустой e-mail"}
  validates :email, :uniqueness => {:message => "Такой e-mail уже есть"}
  validates :email, :format => { :with => email_regex, :message => "Неправильный формат email"}

  default_scope order("created_at DESC")
  
  # paperclip:
  has_attached_file :avatar, :styles => { :thumb => "100x100>"},
  :url => "/system/:attachment/:id/:style/:basename.:extension",
  :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension",
  :default_url => "/assets/avatar.png"
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def self.verify_access(user)
    if user.admin == true
      true
    else
      false
    end
  end
  

  def set_nickname
    self.nickname = email
  end
end
