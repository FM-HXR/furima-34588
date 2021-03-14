require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create: ' do
    before do
      @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)
    end

    # All Green
    it 'all form input present' do 
      expect(@item).to be_valid
    end

    # Errors
    it 'no title' do
      @item.title = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end

    it 'no price' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
    end

    it 'price below 300' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 299")
    end

    it 'price above 9999999' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
    end

    it 'no description' do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'wrong condition option' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it 'wrong mailing option' do
      @item.mailing_cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Mailing cost must be other than 1")
    end

    it 'wrong prefecture option' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it 'wrong posting days option' do
      @item.days_til_post_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days til post must be other than 1")
    end

    it 'wrong category option' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "user doesn't exist" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end

  end
end
