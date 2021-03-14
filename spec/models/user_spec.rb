require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create: ' do
    before do
      @user = FactoryBot.build(:user)
      @user_1 = FactoryBot.build(:user)
    end
    
    # All Green
    it 'All form info present' do
      expect(@user).to be_valid
    end

    it 'Password >= 6 characters, includes letters & numbers' do
      @user.password = "2Jt2FuHv3JsEdYr"
      @user.password_confirmation = @user.password
      expect(@user).to be_valid
    end

    # Errors
    it 'No nickname' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'No email' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'No password' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'No surname' do
      @user.surname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname can't be blank")
    end

    it 'No name' do
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'No surname furigana' do
      @user.surname_furigana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname furigana can't be blank")
    end

    it 'No name furigana' do
      @user.name_furigana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name furigana can't be blank")
    end

    it 'No date of birth' do
      @user.date_of_birth = []
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
    end

    it 'Wrong characters for nickname' do
      @user.nickname = "漢字"
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname is invalid. Alphabets and Numbers only.")
    end

    it 'Wrong characters for surname' do
      @user.surname = "Alphabets"
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname is invalid. Whole case Kanji/Katakana only.")
    end

    it 'Wrong characters for name' do
      @user.name = "Alphabets"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name is invalid. Whole case Kanji/Katakana only.")
    end

    it 'Wrong characters for surname furigana' do
      @user.surname_furigana = "ひらがな"
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname furigana is invalid. Whole case Katakana only.")
    end

    it 'Wrong characters for name furigana' do
      @user.name_furigana = "ひらがな"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name furigana is invalid. Whole case Katakana only.")
    end

    it 'Password <= 5 characters' do
      @user.password = "2Jt2F"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'Wrong password format' do
      @user.password = "aaaaaa"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'Password != confirmation' do
      @user.password_confirmation = "nasdkcjnas"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'Email taken' do
      @user_1.save
      @user.email = @user_1.email
      @user.valid?
      expect(@user.errors.full_messages).to include("Email has already been taken")
      @user_1.destroy
    end

  end
end
