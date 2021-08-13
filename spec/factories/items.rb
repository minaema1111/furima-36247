FactoryBot.define do
  factory :item do
    name {"挑戦者"}
    description {"説明"}
    category_id {10}
    condition_id {2}
    charge_id {3}
    prefecture_id {4}
    scheduled_delivery_id {5}
    price {1000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/IMG_1600.JPG'), filename: 'IMG_1600.JPG')
    end
  end
end
