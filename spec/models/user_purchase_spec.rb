require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  before do
    @user_purchase = FactoryBot.build(:user_purchase)
  end
  
  describe '購入情報の保存' do
    context '購入がうまくいくとき' do
      it "token、post_code、prefecture_id、city、address、building_name、phone_number、user_id、item_idが存在すれば保存できる" do
        expect(@user_purchase).to be_valid
      end

      it "building_nameは空でも保存できる" do
        @user_purchase.building_name = nil
        expect(@user_purchase).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it "tokenが空だと保存できない" do
        @user_purchase.token = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
      end

      it "post_codeが空では保存できない" do
        @user_purchase.post_code = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Post code can't be blank")
      end

      it "post_codeが半角のハイフンを含んだ正しい形式でないと保存できない" do
        @user_purchase.post_code = '1234567'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Post code Input correctly")
      end

      it "prefecture_idが空では保存できない" do
        @user_purchase.prefecture_id = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "prefecture_idが1だと保存できない" do
        @user_purchase.prefecture_id = 1
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Prefecture Select")
      end

      it "cityが空では保存できない" do
        @user_purchase.city = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("City can't be blank")
      end

      it "addressが空では保存できない" do
        @user_purchase.address = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが空では保存できない" do
        @user_purchase.phone_number = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberが半角のハイフンを含んだ形式だと保存できない" do
        @user_purchase.phone_number = "080-5555-4444"
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number Input only number")
      end

      it "phone_numberが12桁以上だと保存できない" do
        @user_purchase.phone_number = "080123456789"
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number Out of setting range")
      end

      it "user_idが空では保存できない" do
        @user_purchase.user_id = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では保存できない" do
        @user_purchase.item_id = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
