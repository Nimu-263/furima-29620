FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"abc123"}
    password_confirmation {password}
    first_name            {Gimei.first.kanji}
    family_name           {Gimei.last.kanji}
    first_name_kana       {Gimei.first.katakana}
    family_name_kana      {Gimei.last.katakana}
    birth_day             {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end