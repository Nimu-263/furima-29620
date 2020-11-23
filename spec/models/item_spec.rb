require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録がうまくいくとき' do
      it "imageとname、explanation、category_id、condition_id、delivery_fee_burden_id、delivery_source_id、delivery_days_id、priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが空だと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "explanationが空だと登録できない" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "category_idが1だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it "category_idが空だと登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "condition_idが１だと登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition Select")
      end
      it "condition_idが空だと登録できない" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it "delivery_fee_burden_idが１だと登録できない" do
        @item.delivery_fee_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee burden Select")
      end
      it "delivery_fee_burden_idが空だと登録できない" do
        @item.delivery_fee_burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee burden can't be blank")
      end

      it "delivery_source_idが１だと登録できない" do
        @item.delivery_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery source Select")
      end
      it "delivery_source_idが空だと登録できない" do
        @item.delivery_source_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery source can't be blank")
      end

      it "delivery_days_idが１だと登録できない" do
        @item.delivery_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days Select")
      end
      it "delivery_days_idが空だと登録できない" do
        @item.delivery_days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days can't be blank")
      end

      it "priceが空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceの範囲が、¥300~¥9,999,999の間でないとだと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "priceの範囲が、¥300~¥9,999,999の間でないとだと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "userが紐付いていないと保存できないこと" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
