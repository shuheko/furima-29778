class OrderAddress

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :zip_code, :prefecture_id, :city, :house_number, :building, :phone_number, :price, :token

  with_options presence: true do
    validates :zip_code,format:{with: /\A\d{3}[-]\d{4}\z/, message: "is invalid"}
    validates :prefecture_id,numericality: { other_than: 1 , message: "is invalid"}
    validates :city
    validates :house_number
    validates :phone_number,format:{with: /\A\d{11}\z/, message: "is invalid"}
    validates :token
  end
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end

end