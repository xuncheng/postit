class Post < ActiveRecord::Base
  attr_accessible :title, :url, :description
  belongs_to :user
  has_many :categorizations
  has_many :categories, through: :categorizations
  validates :title, :url, presence: true
  CATETORY=['Programming', 'Sports']
end
