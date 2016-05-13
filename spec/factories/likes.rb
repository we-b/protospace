FactoryGirl.define do
  factory :like do
    association :prototype
    association :user
  end
end
