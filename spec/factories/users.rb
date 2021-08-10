FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email    {Faker::Internet.free_email}
    password {"123abc"}
    password_confirmation {"123abc"}
    last_name {"市毛"}
    first_name {"智浩"}
    last_name_kana {"イチゲ"}
    first_name_kana {"トモヒロ"}
    birthday {Faker::Date.birthday}
  end
end