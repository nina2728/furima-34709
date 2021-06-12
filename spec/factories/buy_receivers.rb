FactoryBot.define do
  Faker::Config.locale = :ja
  factory :buy_receiver do
    postal_code   { Faker::Address.postcode }
    prefecture_id { Faker::Number.within(range: 2..48) }
    municipality  { Faker::Address.state }
    address       { Faker::Address.street_address }
    building_name { Faker::Address.street_name }
    phone_number  { Faker::PhoneNumber.subscriber_number(length: 11) }
    token         { Faker::Crypto.md5 }
  end
end
