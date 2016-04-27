require 'rails_helper'

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    profile { Faker::Hacker.say_something_smart }
    position { Faker::Company.profession }
    occupation { Faker::Company.catch_phrase }
  end
end
