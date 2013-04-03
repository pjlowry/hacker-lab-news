class Vote < ActiveRecord::Base

  attr_accessible :votable_id, :votable_type

  belongs_to :votable, :polymorphic => true
  validates :votable_id, :presence => true
end