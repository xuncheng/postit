class Post < ActiveRecord::Base
  belongs_to :user
  has_many :categorizations
  has_many :categories, through: :categorizations
  validates :title, :url, presence: true
end
