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

    it "パスワードは数字のみでは登録できないこと" do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "パスワードはアルファベットのみでは登録できないこと"do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    

    it "パスワードは確認用を含めて2回入力すること" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "ユーザー本名は、名字が必須であること" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
    end

    it "ユーザーの本名は、名前が必須であること" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name is invalid")
    end

    it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
      @user.first_name_kana = "123"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")

    end

    it "ユーザー本名のフリガナは、名字が必須であること" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
    end

    it "ユーザー本名のフリガナは、名前が必須であること" do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank", "Family name kana is invalid")
    end

    it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do
      @user.first_name_kana = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "ユーザーの名字のフリガナは全角カタカナで入力させること" do
      @user.family_name_kana = "bbb"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "生年月日が必須であること" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end


  end
end
