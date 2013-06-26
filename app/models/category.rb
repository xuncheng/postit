class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :categorizations
  has_many :posts, through: :categorizations
  validates :name, presence: true
end
