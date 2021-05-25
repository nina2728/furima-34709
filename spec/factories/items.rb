FactoryBot.define do
  factory :item do
    image = fixture_file_upload("/files/test_image.png") 
    name          {Faker::Pokemon.name}
    description   {Faker::Lorem.sentences}
    category_id   {Faker::Number.within(range: 2..4)}
    status_id     {Faker::Number.within(range: 2..4)}
    delivery_id   {Faker::Number.within(range: 2..4)}
    prefecture_id {Faker::Number.within(range: 2..4)}
    shipping_id   {Faker::Number.within(range: 2..4)}
    price         {Faker::Number.within(range: 300..9999999)}
  end
end
