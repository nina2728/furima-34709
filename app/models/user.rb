class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  KANJI_REGEX    = /\A[ぁ-んァ-ン一-龥]/.freeze
  KANA_REGEX     = /\A[ァ-ヶー－]+\z/.freeze

  validates :password,        format: { with: PASSWORD_REGEX }
  validates :nickname,        presence: true, length: { maximum: 40}
  validates :lastname_kanji,  presence: true, format: { with: KANJI_REGEX }
  validates :firstname_kanji, presence: true, format: { with: KANJI_REGEX }
  validates :lastname_kana,   presence: true, format: { with: KANA_REGEX }
  validates :firstname_kana,  presence: true, format: { with: KANA_REGEX }
  validates :date_of_birth,   presence: true
end
