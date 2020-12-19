FactoryBot.define do
  factory :item do
    name                   {Faker::Lorem.word}
    explanation            {Faker::Lorem.sentence}
    category_id            {2}
    condition_id           {2}
    delivery_fee_burden_id {2}
    delivery_source_id     {2}
    delivery_day_id        {2}
    price                  {Faker::Number.between(from: 300, to: 9999999)}

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
