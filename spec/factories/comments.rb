FactoryGirl.define do
  factory :comment do
    association  :prototype
    association  :user
    content      { Faker::Lorem.sentence }
  end
end
