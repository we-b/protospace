FactoryGirl.define do
  factory :like, class: Like do
    prototype_id  { Faker::Number.number(2) }
    user_id       { Faker::Number.number(2) }

    factory :like_with_prototype_id_and_user_id do
      sequence(:prototype_id) { |n| n }
      sequence(:user_id) { |n| n }
    end
  end
end
