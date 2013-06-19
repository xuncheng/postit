class Category < ActiveRecord::Base
  def to_param
    name
  end
  has_many :categorizations
  has_many :posts, through: :categorizations
  validates :name, presence: true
end
