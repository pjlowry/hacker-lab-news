class Comment < ActiveRecord::Base
  attr_accessible :text, :commentable_id, :commentable_type
  validates :text, :presence => true
  belongs_to :commentable
  has_many :votes, :as => :votable
  has_many :comments, :as => :commentable
end