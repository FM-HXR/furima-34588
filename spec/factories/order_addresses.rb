FactoryBot.define do
  factory :order_address do
    postal_code       {"111-1111"}
    prefecture_id     {Faker::Number.between(from: 2, to: 6)}
    city              {Faker::Address.street_name}
    house_number      {Faker::Address.street_address}
    building          {"House of the Rising Sun"}
    phone_number      {"#{Faker::Number.number(digits: 11)}"}
    token             {"tok_abcdefghijk00000000000000000"}
    price             {Faker::Number.between(from: 300, to: 9999999)}
    user_id {1}
    item_id {1}
  end
end
