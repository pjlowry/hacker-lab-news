require 'spec_helper'

describe Comment do 
  context 'validations' do 
    it {should validate_presence_of :text}
  end

  context 'associations' do
    it {should belong_to(:commentable)}
    it {should have_many(:votes)}
    it {should have_many(:comments)}
  end

  context 'accessibility' do 
    it {should allow_mass_assignment_of :commentable_id}
    it {should allow_mass_assignment_of :commentable_type}
    it {should allow_mass_assignment_of :text}

  end

end