class Post < ActiveRecord::Base
  attr_accessible :source_url, :headline, :points

  validates :source_url, :presence => true,
                         :format => { :with => /(https|http):\/\/\S+/,
                                      :message => "Must be a real URL" }
  validates :headline, :presence => true

end