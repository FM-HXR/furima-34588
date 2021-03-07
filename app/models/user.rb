class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true, length: { maximum: 10 }
  validates :email, presence: true
  validates :password, presence: true

  has_many :items
  has_many :comments, dependent: :destroy
  has_many :orders
end
