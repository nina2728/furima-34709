require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる時' do
      it '正しい値を入力すれば商品を出品できる' do
        expect(@item).to be_valid
      end
      it '価格が指定の範囲内であれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない時' do
      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが選択されていないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態が選択されていないと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it '配送料の負担が選択されていないと出品できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery must be other than 1')
      end
      it '発送元の地域が選択されていないと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '発送までの日数が選択されていないと出品できない' do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping must be other than 1')
      end
      it '価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が300より下だと出品できない' do
        @item.price = Faker::Number.within(range: 1..299)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it '価格が9,999,999より上だと出品できない' do
        @item.price = Faker::Number.within(range: 10_000_000..100_000_000)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end
      it '紐づくユーザーが存在しないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
