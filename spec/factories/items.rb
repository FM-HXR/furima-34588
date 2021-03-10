FactoryBot.define do
  factory :item do
    title              {Faker::Name.name}
    price              {Faker::Number.between(from: 300, to: 9999999)}
    description        {Faker::Lorem.paragraph(sentence_count: 3)}
    condition_id       {Faker::Number.between(from: 2, to: 6)}
    mailing_cost_id    {Faker::Number.between(from: 2, to: 3)}
    prefecture_id      {Faker::Number.between(from: 2, to: 48)}
    days_til_post_id   {Faker::Number.between(from: 2, to: 4)}
    category_id        {Faker::Number.between(from: 2, to: 11)}
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open("#{Rails.root}/app/assets/images/flag.png"), filename: "flag.png")
    end  
  end
end