FactoryBot.define do
  factory :item do

    association :user

    name          {Faker::Games::Pokemon.name}
    description   {Faker::Lorem.sentences}
    category_id   {Faker::Number.within(range: 2..4)}
    status_id     {Faker::Number.within(range: 2..4)}
    delivery_id   {Faker::Number.within(range: 2..4)}
    prefecture_id {Faker::Number.within(range: 2..4)}
    shipping_id   {Faker::Number.within(range: 2..4)}
    price         {Faker::Number.within(range: 300..9999999)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
