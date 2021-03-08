class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true, length: { maximum: 10 }
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  with_options presence: true do
    validates :nickname, format: {with: /\A[a-z\d]+\z/i, message: "Is invalid. Alphabets and Numbers only."}
    validates :surname, format: {with: /\A[ァ-ヶ一-龥々]/, message: "Is invalid. Whole case Kanji/Katakana only."}
    validates :name, format: {with: /\A[ァ-ヶ一-龥々]/, message: "Is invalid. Whole case Kanji/Katakana only."}
    validates :surname_furigana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Is invalid. While case Katakana only."}
    validates :name_furigana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Is invalid. Whole case Katakana only."}
  end 

  has_many :items
  has_many :comments, dependent: :destroy
  has_many :orders
end
