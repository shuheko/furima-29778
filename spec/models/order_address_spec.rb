require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end

    it '配送先の情報として、郵便番号が必須であること' do
      @order_address.zip_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Zip code can't be blank")
    end

    it '郵便番号はハイフンが必要であること' do
      @order_address.zip_code = 0000000
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Zip code is invalid")
    end

    it '配送先の情報として、都道府県が必須であること' do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '都道府県の情報が、--では保存できない'do
    @order_address.prefecture_id = 1
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include("Prefecture is invalid")
    end

    it '配送先の情報として、市区町村が必須であること' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it '配送先の情報として、番地が必須であること' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end

    it '配送先の情報として、電話番号が必須であること' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が11桁であること' do
      @order_address.phone_number = 00000000
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
