class Post < ActiveRecord::Base
  attr_accessible :title, :url, :description
end
