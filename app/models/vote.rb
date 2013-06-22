class Vote < ActiveRecord::Base
  belongs_to :users
  belongs_to :voteable, polymorphic: true
end
