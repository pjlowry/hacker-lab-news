FactoryGirl.define do
  factory :post do
    sequence(:source_url) {|n| "http://www#{n}.google.com"}
    headline 'GOOGLE'

    factory :post_with_votes do
      after(:create) {|post| FactoryGirl.create(:vote, :votable_id => post.id, :votable_type => post.class)}
    end
  end

  factory :vote do
    association :votable, :factory => :post
  end

  factory :user do 
    sequence(:email) { |n| "abc#{n}@gmail.com" }
    screen_name 'abcdefg'
    password 'abc1234'
    password_confirmation 'abc1234'
  end
end