FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"齊藤"}
    first_name            {"雄太"}
    family_name_kana      {"サイトウ"}
    first_name_kana       {"ユウタ"}
    birthdate             {"2020-08-04"}
  end
end


