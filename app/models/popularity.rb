module Popularity

  def points
    Vote.where(:votable_id => self.id).length
  end

  # def self.ranked
  #   self.all.sort {|a,b| a.rank <=> b.rank}.reverse
  # end

  def rank
    self.points/(((Time.now.gmtime - self.created_at)/3600)**2)
  end
end