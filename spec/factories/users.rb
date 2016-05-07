FactoryGirl.define do
  factory :user do
    password = Faker::Internet.password(8)
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password password
    password_confirmation password
    profile { Faker::Hacker.say_something_smart }
    position { Faker::Company.profession }
    occupation { Faker::Company.catch_phrase }

    factory :user_with_id do
      sequence(:id) { |n| n }
    end
  end
end
