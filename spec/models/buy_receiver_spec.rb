require 'rails_helper'

RSpec.describe BuyReceiver, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_receiver = FactoryBot.build(:buy_receiver, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it '正しい情報を入力し、クレジットカードが認証すれば購入できる' do
        expect(@buy_receiver).to be_valid
      end
      it '建物名が空でも登録できる' do
        @buy_receiver.building_name = ""
        expect(@buy_receiver.errors.full_messages).to be_valid
      end
    end

    context '商品購入できない時' do
      it 'クレジットカード、又はクレジットカードの入力に不備がありPAYJPからトークンが発行されなければ購入できない' do
        @buy_receiver.token = nil
        @buy_receiver.valid?
        expect(@buy_receiver.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では登録できない' do
        @buy_receiver.postal_code = ""
        @buy_receiver.valid?
        expect(@buy_receiver.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が数字のみでは登録できない' do
        @buy_receiver.postal_code = "1234567"
        @buy_receiver.valid?
        expect(@buy_receiver.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県を選択しなければ登録できない' do
        @buy_receiver.prefecture_id = "1"
        @buy_receiver.valid?
        expect(@buy_receiver.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では登録できない' do
        @buy_receiver.municipality = ""
        @buy_receiver.valid?
        expect(@buy_receiver.errors.full_messages).to include("Municipality can't be blank")
      end
      it '市区町村に英数字が入ると登録できない' do
        @buy_receiver.municipality = "saitama1-1-1"
        @buy_receiver.valid?
        expect(@buy_receiver.errors.full_messages).to include("Municipality is invalid")
      end
      it '番地が空では登録できない' do
        @buy_receiver.address = ""
        @buy_receiver.valid?
        expect(@buy_receiver.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では登録できない' do
        @buy_receiver.phone_number = ""
        @buy_receiver.valid?
        expect(@buy_receiver.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が11文字以上では登録できない' do
        @buy_receiver.phone_number = "123456789123"
        @buy_receiver.valid?
        expect(@buy_receiver.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'ログイン状態でないと購入できない' do
        @buy_receiver.user_id = nil
        @buy_receiver.valid?
        expect(@buy_receiver.errors.full_messages).to include("User can't be blank")
      end
      it '商品が存在しないと購入できない' do
        @buy_receiver.item_id = nil
        @buy_receiver.valid?
        expect(@buy_receiver.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
