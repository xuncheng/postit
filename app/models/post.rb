class Post < ActiveRecord::Base
  include Voteable
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :comments

  validates :title, :url, presence: true

end
