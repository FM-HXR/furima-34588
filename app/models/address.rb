class Address < ApplicationRecord
  # Validatations written in order_address.rb
  validates :order_id, presence: true
  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
