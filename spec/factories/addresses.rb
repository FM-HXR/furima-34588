FactoryBot.define do
  factory :address do
    postal_code       {"111-1111"}
    prefecture_id     {Faker::Number.between(from: 2, to: 6)}
    city              {Faker::Address.street_name}
    house_number      {Faker::Address.street_address}
    building          {"House of the Rising Sun"}
    phone_number      {"0#{Faker::Number.number(digits: 10)}"}

    association :order
  end
end
