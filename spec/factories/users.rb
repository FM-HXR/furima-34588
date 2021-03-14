FactoryBot.define do
  factory :user do
    nickname {"Joe226"}
    email    {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    surname  {"渦巻"}
    name     {"鳴門"}
    surname_furigana {"ウズマキ"}
    name_furigana {"ナルト"}
    date_of_birth {Date.strptime('2000-01-01', '%Y-%m-%d')}
  end
end
