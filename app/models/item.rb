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
  validates :price,         numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }
  validates :category_id,   numericality: { other_than: 1 }
  validates :status_id,     numericality: { other_than: 1 }
  validates :delivery_id,   numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_id,   numericality: { other_than: 1 }
end
