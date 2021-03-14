require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @order = FactoryBot.build(:order)
  end

  describe '#Create' do
    
    # All green
      it 'user & item present' do
        @user.save
        @item.save
        expect(@order).to be_valid
        @user.destroy
        @item.destroy
      end

    # Errors
      it 'no user nor item' do
        expect(@order.errors.full_messages).to include()
      end
  end
end
