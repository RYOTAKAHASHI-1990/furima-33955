class Item < ApplicationRecord

  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  validates :name
  validates :description
  validates :category_id
  validates :condition_id
  validates :shipping_cost_id
  validates :prefecture_id
  validates :shipping_day_id
  validates :price
end
