FactoryGirl.define do
  factory :prototype, class: Prototype do
    association :user
    title       { Faker::Name.name }
    catch_copy  { Faker::Lorem.word }
    concept     { Faker::Lorem.sentence }
    created_at  { Faker::Time.between(2.days.ago, Time.now) }

    after(:build) do |prototype|
      prototype.main_image = build(:main_image)
    end

    trait :with_sub_images do
      transient do
        sub_images_count 3
      end

      after(:build) do |prototype, evaluator|
        prototype.captured_images << build_list(:sub_image, evaluator.sub_images_count)
      end
    end

    trait :with_comments do
      transient do
        comments_count 5
      end

      after(:create) do |prototype, evaluator|
        prototype.comments << create_list(:comment, evaluator.comments_count)
      end
    end
  end
end
