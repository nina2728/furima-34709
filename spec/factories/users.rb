FactoryBot.define do
  
  factory :user do

    nickname              {Faker::Name.name(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    lastname_kanji        { "山田" }
    firstname_kanji       { "太郎" }
    lastname_kana         { "ヤマダ" }
    firstname_kana        { "タロウ" }
    date_of_birth         {Faker::Date.indate_period}
  end
end
