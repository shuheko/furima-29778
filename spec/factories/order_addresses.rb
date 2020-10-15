FactoryBot.define do
  factory :order_address do
    zip_code {'000-0000'}
    prefecture_id {11}
    city {'姫路市'}
    house_number {'姫路１−１'}
    building {'マンション101'}
    phone_number {'00000000000'}
    token {"101aqws"}
  end
end
