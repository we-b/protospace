FactoryGirl.define do
  factory :main do
    association :prototype
    status    :main
    user_id   { Faker::Number.number(2) }
    content   { fixture_file_upload("spec/fixtures/img/sample.png")}
  end

  factory :sub do
    association :prototype
    status    :sub
    user_id   { Faker::Number.number(2) }
    content   { fixture_file_upload("spec/fixtures/img/sample.png")}
  end
end
