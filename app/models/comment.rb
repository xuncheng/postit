class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :votes, as: :voteable

  validates :body, presence: true

  def total_votes
    self.votes.where(vote: true).count - self.votes.where(vote: false).count
  end
end
