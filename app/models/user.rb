class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/.freeze
  KANJI_REGEX    = /\A[ぁ-んァ-ン一-龥]/.freeze
  KANA_REGEX     = /\A[ァ-ヶー－]+\z/.freeze

  validates :password,        format: { with: PASSWORD_REGEX, message: "半角英数字混合かつ６文字以上入力"}
  validates :nickname,        presence: true, length: { maximum: 40}
  validates :lastname_kanji,  presence: true, format: { with: KANJI_REGEX, message: "全角かな、全角カナ、漢字が使用できます" }
  validates :firstname_kanji, presence: true, format: { with: KANJI_REGEX, message: "全角かな、全角カナ、漢字が使用できます" }
  validates :lastname_kana,   presence: true, format: { with: KANA_REGEX, message: "全角カナのみ使用できます" }
  validates :firstname_kana,  presence: true, format: { with: KANA_REGEX, message: "全角カナのみ使用できます" }
  validates :date_of_birth,   presence: true
end
