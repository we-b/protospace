include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :captured_image, class: CapturedImage do
    content { fixture_file_upload("spec/fixtures/img/sample.png", 'image/png') }

    trait :main do
      status   :main
    end

    trait :sub do
      status   :sub
    end

    factory :main_image, traits: [:main]
    factory :sub_image, traits: [:sub]
  end
end
