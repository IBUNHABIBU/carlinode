FactoryBot.define do
  factory :car do
    color { 'Red' }
    engine { 'v8' }
    year { '2021' }
    price { '2300usd' }
    title { 'Cardillac' }
    image { Rack::Test::UploadedFile.new('app/assets/Prado.jpg', 'image/jpeg') }
  end
end
