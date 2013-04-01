require 'spec_helper'

describe Post do
  context 'validations' do
    it {should validate_presence_of :source_url}
    it {should validate_presence_of :headline}
    it {should allow_value("http://www.com").for(:source_url)}
    it {should allow_value("https://www.com").for(:source_url)}
    it {should_not allow_value("http//www.com").for(:source_url)}
    it {should_not allow_value("https:www.com").for(:source_url)}
    it {should_not allow_value("www.com").for(:source_url)}
  end

  context 'accessibility' do 
    it {should allow_mass_assignment_of :source_url}
    it {should allow_mass_assignment_of :headline}
    it {should allow_mass_assignment_of :points}
  end
end