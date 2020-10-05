class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :area_id
    validates :days_id
    validates :price, inclusion: { in: 300..9999999}
    validates :image
  end
end
