FactoryBot.define do
  Faker::Config.locale = :ja
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    lastname_kanji        { person.last.kanji }
    firstname_kanji       { person.first.kanji }
    lastname_kana         { person.last.katakana }
    firstname_kana        { person.first.katakana }
    date_of_birth         { Faker::Date.in_date_period }
  end
end
