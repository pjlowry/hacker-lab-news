require 'spec_helper'

describe Post do
  context 'validations' do
    it {should validate_presence_of :source_url}
    it {should validate_presence_of :headline}
  end

   context 'accessibility' do 
    it {should allow_mass_assignment_of :source_url}
    it {should allow_mass_assignment_of :headline}
  end
end