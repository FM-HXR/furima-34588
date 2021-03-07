class Address < ApplicationRecord
  validates :postal_code, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
  validates :phone_number, presence: true
  
  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
