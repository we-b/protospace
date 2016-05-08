FactoryGirl.define do
  factory :like, class: Like do
    association :prototype, :user
    prototype_id  { Faker::Number.number(2) }
    user_id       { Faker::Number.number(2) }
  end
end
