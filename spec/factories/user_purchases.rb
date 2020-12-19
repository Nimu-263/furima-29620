FactoryBot.define do
  factory :user_purchase do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '八王子市' }
    address { '1-1−1' }
    building_name { '東京ハイツ' }
    phone_number { "08055554444" }
    user_id { 1 }
    item_id { 1 }
  end
end
