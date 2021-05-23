class Item < ApplicationRecord
  belongs_to :user
  has_one    :buy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :shipping
  belongs_to :status
end
