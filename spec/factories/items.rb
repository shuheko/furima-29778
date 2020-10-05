FactoryBot.define do
  factory :item do
    name           {"hoge"}
    explanation    {"アイウエオ"}
    category_id    {3}
    starus_id      {2}
    shipping_id    {2}
    area_id        {17}
    days_id        {2}
    price          {"10000"}
    user_id        {2}
  end
end
