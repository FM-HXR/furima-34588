class Order < ApplicationRecord
  # Validatations written in order_address.rb

  belongs_to :item
  belongs_to :user
  has_one :address
end
