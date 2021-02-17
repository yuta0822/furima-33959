FactoryBot.define do
  factory :order_address do

    post_code        { '123-4567' }
    prefecture_id    { 2 }
    city             { '東京都' }
    home_number      { '1-1' }
    building_name    { '台東区ビル' }
    phone_number     { '09012345678' }
    token            {"tok_abcdefghijk00000000000000000"}
  end
end