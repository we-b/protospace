FactoryGirl.define do
  factory :captured_image, class: CapturedImage do
    prototype_id   { Faker::Number.number(2) }
    content        { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/img/sample.png')) }

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
