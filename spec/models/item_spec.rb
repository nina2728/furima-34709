require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe '商品出品機能' do
  context '商品出品できる時' do
    it '正しい値を入力すれば商品を出品できる' do
      
    end
    it '価格が指定の範囲内であれば出品できる' do
      
    end
  end
  context '商品出品できない時' do
    it '画像が空では出品できない' do
      
    end
    it '商品名が空では出品できない' do
      
    end
    it '商品の説明が空では出品できない' do
      
    end
    it 'カテゴリーが選択されていないと出品できない' do
      
    end
    it '商品の状態が選択されていないと出品できない' do
      
    end
    it '配送料の負担が選択されていないと出品できない' do
      
    end
    it '発送元の地域が選択されていないと出品できない' do
      
    end
    it '発送までの日数が選択されていないと出品できない' do
      
    end
    it '価格が空では出品できない' do
      
    end
    it '価格が指定の範囲外だと出品できない' do
      
    end
  end
end
