FactoryGirl.define do
  factory :prototype, class: Prototype do
    title       { Faker::Name.name }
    catch_copy  { Faker::Lorem.word }
    concept     { Faker::Lorem.sentence }

    after(:build) do |prototype|
      prototype.main_image = create(:main_image, prototype: prototype)
    end

    trait :with_sub_images do
      transient do
        sub_images_count 3
      end

      after(:build) do |prototype, evaluator|
        prototype.captured_images << build_list(:sub_image, evaluator.sub_images_count)
      end
    end
  end
end
