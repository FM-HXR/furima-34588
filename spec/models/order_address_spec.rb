require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#Create: ' do
    before do
      @order_address = FactoryBot.build(:order_address)
      
    end

    # All green
    it 'all params present' do
      expect(@order_address).to be_valid
    end

    it 'building params not needed' do
      @order_address.building = ""
      expect(@order_address).to be_valid
    end

    # Errors
    it 'no token' do
      @order_address.token = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'prefecture option is blank' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it 'city is blank' do
      @order_address.city = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it 'house number is blank' do
      @order_address.house_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end

    it 'phone number is blank' do
      @order_address.phone_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank",
        "Phone number is too short (minimum is 10 characters)",
        "Phone number is invalid. Numbers only.")
    end

    it 'phone number is not a number' do
      @order_address.phone_number = "helloworld"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid. Numbers only.")
    end

    it 'phone number is not a number' do
      @order_address.phone_number = "1234567890123"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 12 characters)")
    end

    it 'price is blank' do
      @order_address.price = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Price can't be blank")
    end

    it 'no user' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end

    it 'no item' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
