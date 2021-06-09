class BuyReceiver
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :address
    validates :phone_number, numericality: { only_integer: true, maxlength: "11" }
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Receiver.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address,
                    building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end
