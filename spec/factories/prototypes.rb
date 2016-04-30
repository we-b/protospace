FactoryGirl.define do
  factory :prototype do
    association :user
    title       { Faker::Name.name }
    catch_copy  { Faker::Lorem.word }
    concept     { Faker::Lorem.sentence }
    user_id     { Faker::Number.number(2) }

    after(:build) do |prototype|
      build(:main_image, prototype: prototype)
      build_list(:sub_image, prototype: prototype, 3)
    end
  end
end
