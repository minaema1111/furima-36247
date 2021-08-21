require 'rails_helper'

RSpec.describe PurchaseResidence, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_residence = FactoryBot.build(:purchase_residence, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  context '内容に問題ない場合' do
    it '全ての項目が正しく入力されていれば保存ができること' do
      expect(@purchase_residence).to be_valid
    end
    it 'building_nameが空でも保存できる' do
      @purchase_residence.building_name = ''
      expect(@purchase_residence).to be_valid
  end
end

  context '内容に問題ある場合' do
    it 'tokenが空の場合保存できない' do
      @purchase_residence.token = ''
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空では登録できない' do
      @purchase_residence.postal_code = ''
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'prefecture_idが選択されていないと登録できない(1が選ばれた時)' do
      @purchase_residence.prefecture_id = '1'
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'municipalitiesが空では登録できない' do
      @purchase_residence.municipalities = ''
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Municipalities can't be blank")
    end
    it 'house_numberが空では登録できない' do
      @purchase_residence.house_number = nil
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberが空では登録できない' do
      @purchase_residence.phone_number = ''
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'postal_codeにハイフンが入っていないとき' do
      @purchase_residence.postal_code = 1234567
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Postal code Enter it as follows (e.g. 123-4567)")
    end
    it 'phone_numberが正しく入力されていないとき' do
      @purchase_residence.phone_number = '0901234567a'
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Phone number Input only number")
    end
    it 'phone_numberが半角数字で入力されていないとき' do
      @purchase_residence.phone_number = '0９０１２３４５６７８'
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Phone number Input only number")
    end
    it 'user_idが空では登録できない' do
      @purchase_residence.user_id = ''
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空では登録できない' do
      @purchase_residence.item_id = ''
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Item can't be blank")
    end
    it 'phone_numberにハイフンが入っている場合登録できない' do
      @purchase_residence.phone_number = '090-1234567'
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Phone number Input only number")
    end
    it 'phone_numberが9桁以下では登録できない' do
      @purchase_residence.phone_number = '12345678'
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Phone number Input only number")
    end
    it 'phone_numberが12桁以上では登録できない' do
      @purchase_residence.phone_number = '123456789123'
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Phone number Input only number")
    end
    it 'phone_numberが全角数字では登録できない' do
      @purchase_residence.phone_number = '０９０１２３４５６７８'
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Phone number Input only number")
    end
    it 'phone_numberが英数字混合では登録できない' do
      @purchase_residence.phone_number = 'a1b2c3d4e5f'
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Phone number Input only number")
    end
    it 'phone_numberが全角文字では登録できない' do
      @purchase_residence.phone_number = 'けいたいでんわけいたい'
      @purchase_residence.valid?
      expect(@purchase_residence.errors.full_messages).to include("Phone number Input only number")
    end
  end
end
