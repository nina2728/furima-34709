class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  KANJI_REGEX    = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  KANA_REGEX     = /\A[ァ-ヶー－]+\z/.freeze

  validates :password,        format: { with: PASSWORD_REGEX }
  with_options presence: true do
    validates :nickname,        length: { maximum: 40}
    validates :lastname_kanji,  format: { with: KANJI_REGEX }
    validates :firstname_kanji, format: { with: KANJI_REGEX }
    validates :lastname_kana,   format: { with: KANA_REGEX }
    validates :firstname_kana,  format: { with: KANA_REGEX }
    validates :date_of_birth
  end

  has_many :items
  has_many :buys
end
