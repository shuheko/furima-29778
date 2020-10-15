class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping
  belongs_to_active_hash :area
  belongs_to_active_hash :days
  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id,format:{ with: /\A[2-9]|1[0-1]\z/, message: "is invalid"}
    validates :status_id,format:{ with: /\A[2-7]\z/, message: "is invalid"}
    validates :shipping_id,format:{ with: /\A[2-3]\z/, message: "is invalid"}
    validates :area_id,format:{ with: /\A[2-9]|[2-4][0-9]\z/, message: "is invalid"}
    validates :days_id,format:{ with: /\A[2-4]\z/, message: "is invalid"}
    validates :price, inclusion: { in: 300..9999999}
    validates :image
  end
end
