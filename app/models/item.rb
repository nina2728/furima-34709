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
    validates :price
    validates :image
    with_options numericality: { order_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_id
      validates :prefecture_id
      validates :shipping_id
    end
  end 
end
