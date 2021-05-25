FactoryBot.define do
  factory :item do
    image = fixture_file_upload("/files/test_image.png") 
    name        {Faker::Pokemon.name}
    description {Faker::Lorem.sentences}
    price       {Faker::Number.within(range: 300..9999999)}
    ah_id       {Faker::Number.within(range: 2..4)}
  end
end
