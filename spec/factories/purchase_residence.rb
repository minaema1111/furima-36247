FactoryBot.define do
  factory :purchase_residence do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    prefecture_id { 12 }
    municipalities { 'テスト市' }
    house_number { '1-1-1' }
    phone_number { '09012345678' }
    building_name { 'テストビル' }
  end
end
