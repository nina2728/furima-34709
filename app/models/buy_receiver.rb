class Buy_receiver
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :buy_id

  with_options presence: true do
    with_options foreign_key: true do
      validates :user_id
      validates :item_id
      validates :buy_id
    end
    validates :postal_code, /\A\d{3}[-]\d{4}\z/
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :municipality, /\A[ぁ-んァ-ン一-龥]/
    validates :address
    validates :phone_number, numericality: { only_integer: true, less_than: 11 }
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Receiver.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end