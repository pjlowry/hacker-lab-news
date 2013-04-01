FactoryGirl.define do
  factory :post do
    sequence(:source_url) {|n| "http://www#{n}.google.com"}
    headline 'GOOGLE'
  end
end