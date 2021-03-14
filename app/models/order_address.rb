# The naming must follow association hierarchy.
# Order has one address, address belongs to order.
# Ergo, OrderAddress
class OrderAddress
  include ActiveModel::Model
  # The parameters that the "hybrid model" (form_object) will accept from the controller.
  # Don't forget building info. It doesn't need validation but needs to be accepted.
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :price, :token
  # attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number

  
  # Addresses column
  validates :city, presence: true
  validates :house_number, presence: true
  # Accessor & Validates for order_id is unnecessary since it cannot exist until order record is created (line 28)
  # Building doesn't need to be present.

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Please use the correct format."}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :phone_number, length: {minimum: 10, maximum: 12}, format: {with: /\d+/, message: "is invalid. Numbers only."}
  end
  
  # Orders column
  validates :item_id, presence: true
  validates :user_id, presence: true
  # Pay.jp token validates:
  validates :token, presence: true
  validates :price, presence: true

  def save
    # Split passed params into seperate create methods for each model.
    # Token will NOT be saved to the orders table. Unnecassary.
    order = Order.create(item_id: item_id, user_id: user_id)
    address = Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end