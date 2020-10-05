require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do

    before do
      @item = FactoryBot.build(:item)
    end


    it '画像は1枚必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が必須であること' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が必須であること' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'カテゴリーの情報が"--"ではないこと'do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is invalid")
    end

    it '商品の状態についての情報が必須であること' do
      @item.status = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it '商品の状態の情報が"--"ではないこと'do
      @item.status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Status is invalid")
    end

    it '配送料の負担についての情報が必須であること' do
      @item.shipping = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping can't be blank")
    end

    it '配送料の負担についての情報が"--"ではないこと'do
      @item.shipping_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping is invalid")
    end

    it '発送元の地域についての情報が必須であること' do
      @item.area = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end

    it '発送元の地域についての情報が"--"ではないこと'do
      @item.area_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Area is invalid")
    end

    it '発送までの日数についての情報が必須であること' do
      @item.days_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Days can't be blank")
    end

    it '発送までの日数についての情報が"--"ではないこと'do
      @item.days_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Days is invalid")
    end

    it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格の範囲が、¥300以上であること' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it '価格の範囲が、¥10000000以下であること'do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
  end
end
