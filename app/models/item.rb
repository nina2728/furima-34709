class Item < ApplicationRecord
  belongs_to :user
  has_one    :buy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :shipping
  belongs_to :status

  with_options presence: true do
    validates :name
    validates :description
    validates :image
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id,   numericality: { less_than_or_equal_to: 11 }
    validates :status_id,     numericality: { less_than_or_equal_to: 7 }
    validates :delivery_id,   numericality: { less_than_or_equal_to: 3 }
    validates :prefecture_id, numericality: { less_than_or_equal_to: 48 }
    validates :shipping_id,   numericality: { less_than_or_equal_to: 4 }
  end
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
end
