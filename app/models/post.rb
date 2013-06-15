class Post < ActiveRecord::Base
  belongs_to :user
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :comments
  validates :title, :url, presence: true
end
