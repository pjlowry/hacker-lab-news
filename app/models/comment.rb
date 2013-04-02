class Comment < ActiveRecord::Base
  include Popularity
  
  attr_accessible :text, :commentable_id, :commentable_type
  validates :text, :presence => true
  belongs_to :commentable
  has_many :votes, :as => :votable
  has_many :comments, :as => :commentable

  def self.ranked
    self.all.sort {|a,b| a.rank <=> b.rank}.reverse
  end
end