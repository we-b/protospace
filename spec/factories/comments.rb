FactoryGirl.define do
  factory :comment do
    prototype
    user
    content      { Faker::Lorem.sentence }
  end
end
