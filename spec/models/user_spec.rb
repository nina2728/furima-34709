require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '正しい値を入力すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'password,password_confirmationが６文字以上、英数字混合であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'password,password_confirmationが英語のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        expect(@user.errors.full_messages).to include("")
      end
      end
      it 'password,password_confirmationが数字のみでは登録できない' do
      end
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'password_confirmationが空では登録できない' do
      end
      it 'passwordとpassword_confirmationが不一致だと登録できない' do
      end
      it 'lastname_kanjiが空では登録できない' do
      end
      it 'firstname_kanjiが空では登録できない' do
      end
      it 'lastname_kanaが空では登録できない' do
      end
      it 'firstname_kanaが空では登録できない' do
      end
      it 'date_of_birthが空では登録できない' do
      end
    end
  end
end