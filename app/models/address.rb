class Address < ApplicationRecord
  # Validatations written in order_address.rb

  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
