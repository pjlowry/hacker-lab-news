class Post < ActiveRecord::Base
  attr_accessible :source_url, :headline, :points

  validates :source_url, :presence => true,
                         :format => { :with => /(https|http):\/\/\S+/,
                                      :message => "Must be a real URL" }
  validates :headline, :presence => true

  has_many :votes, :as => :votable
  has_many :comments, :as => :commentable

  def points
    Vote.where(:votable_id => self.id).length
  end

end