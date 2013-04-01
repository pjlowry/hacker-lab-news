require 'spec_helper'

describe Vote do
  context 'associations' do
    it {should belong_to(:votable)}
  end

  context 'accessibility' do 
    it {should allow_mass_assignment_of :votable_id}
    it {should allow_mass_assignment_of :votable_type}
  end
end