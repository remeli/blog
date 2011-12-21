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
  attr_accessible :email, :password, :password_confirmation, :admin
  before_save :encrypt_password
  has_many :comments, :dependent => :destroy
  
  validates :password, :confirmation => {:message => "Пароли не совпадают"}
  validates :password, :presence => {:message => "Пустой пароль"} , :on => :create
  validates :email, :presence => {:message => "Пустой e-mail"}
  validates :email, :uniqueness => {:message => "Такой e-mail уже есть"}

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :format => { :with => email_regex, :message => "Неправильный формат email"}

  default_scope order("created_at DESC")
  
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

end
