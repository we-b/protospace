FactoryGirl.define do
  factory :prototype, class: Prototype do
    title       { Faker::Name.name }
    catch_copy  { Faker::Lorem.word }
    concept     { Faker::Lorem.sentence }
    user

    after(:build) do |prototype|
      prototype.main_image = build(:main_image)
    end

    trait :with_sub_images do
      transient do
        maxinum_sub_images 3
      end

      after(:build) do |prototype, evaluator|
        prototype.captured_images << build_list(:sub_image, evaluator.maxinum_sub_images)
      end
    end
  end
end
