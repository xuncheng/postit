class User < ActiveRecord::Base
  def to_param
    username
  end
  attr_accessible :username, :email, :password, :password_confirmation, :remember_token
  has_many :posts
  has_many :comments

  has_secure_password
  before_save {|user| user.email = email.downcase}
  before_save :create_remember_token
  validates :username, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true
  after_validation {self.errors.messages.delete(:password_digest)}

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
