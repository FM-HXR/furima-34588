class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true, length: { maximum: 20 }
  validates :email, presence: true
  validates :password, presence: true
  # 
  validates :date_of_birth, presence: true
  with_options presence: true do
    validates :password, presence: true, format: {with: /\A(?=.*?[a-zA-Z])(?=.*?[\d])[a-z\d]+\z/i}, length: { minimum: 6 }
    validates :nickname, format: {with: /\A[a-z][a-z\d]+\z/i, message: "is invalid. Alphabets and Numbers only."}
    validates :surname, format: {with: /\A[ぁ-んァ-ヶ一-龥々]/, message: "is invalid. Whole case Kanji/Katakana/Hiragana only."}
    validates :name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]/, message: "is invalid. Whole case Kanji/Katakana/Hiragana only."}
    validates :surname_furigana, format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Whole case Katakana only."}
    validates :name_furigana, format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Whole case Katakana only."}
  end 

  has_many :items
  has_many :comments, dependent: :destroy
  has_many :orders
end
