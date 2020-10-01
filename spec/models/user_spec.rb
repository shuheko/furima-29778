require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do

    before do
      @user = FactoryBot.build(:user)
    end

    it "nameとemail、passwordとpassword_confirmation、first_name、family_name、それぞれのフリガナ、birthdayが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "ニックネームが必須であること" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "メールアドレスが必須であること" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "メールアドレスは@を含む必要があること" do
      @user.email = "aaa.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid", "Email is invalid")
    end

    it "パスワードが必須であること" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードは6文字以上であること" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password is invalid")
    end

    it "パスワードは半角英数字混合であること" do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

    end

    it "パスワードは確認用を含めて2回入力すること" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it"ユーザー本名が、名字と名前がそれぞれ必須であること" do
      @user.first_name = nil
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid", "Family name can't be blank", "Family name is invalid")
    end

    it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
      @user.first_name_kana = "123"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")

    end

    it "ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること" do
      @user.first_name_kana = nil
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid", "Family name kana can't be blank", "Family name kana is invalid")
    end
    it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
      @user.first_name_kana = "aaa"
      @user.family_name_kana = "bbb"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid", "Family name kana is invalid")
    end
    it "生年月日が必須であること" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end


  end
end
