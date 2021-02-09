FactoryBot.define do
  factory :item do
    association :user

    name            {"名前"}
    explanation     {"説明"}
    price           {1111}
    category_id     {2}
    condition_id    {2}
    postage_id      {2}
    prefecture_id   {2}
    prepare_id      {2}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
    