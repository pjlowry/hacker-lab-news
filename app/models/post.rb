class Post < ActiveRecord::Base
  attr_accessible :source_url, :headline

  validates :source_url, :headline, :presence => true
end