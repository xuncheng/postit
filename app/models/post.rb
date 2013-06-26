class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :comments
  has_many :votes, as: :voteable

  validates :title, :url, presence: true

  def total_votes
    self.votes.where(vote: true).count - self.votes.where(vote: false).count
  end
end
