require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user = FactoryBot.build(:user)
      @user.nickname = ""
      @user.valid?
    end
    it 'emailが空では登録できない' do
      # ここにemailが空では登録できないことを検証するテストコードを記述する
    end
  end
end
