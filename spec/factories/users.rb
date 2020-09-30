FactoryBot.define do
  factory :user do
    name {'タロー'}
    email {Faker::Internet.free_email}
    password {'hoge1234'}
    password_confirmation {password}
    first_name {'山口'}
    family_name     {'太郎'}
    first_name_kana {'ヤマグチ'}
    family_name_kana {'タロウ'}
    birthday         {Faker::Date.in_date_period}
  end
end
