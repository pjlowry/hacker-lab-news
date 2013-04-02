require 'spec_helper'

describe User do

  context 'validations' do 
    it {should validate_uniqueness_of :email}
  end

  context 'accessibility' do 
    it {should allow_mass_assignment_of :email}
    it {should allow_mass_assignment_of :screen_name}
    it {should allow_mass_assignment_of :password}
    it {should allow_mass_assignment_of :password_confirmation}
  end
end
