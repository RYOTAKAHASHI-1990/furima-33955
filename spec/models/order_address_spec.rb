require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

  context '購入情報の保存に成功した時' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it 'building_nameは空でも登録できること' do
      @order_address.building_name = nil
      expect(@order_address).to be_valid
    end
  end
  context '購入情報の保存に失敗した時' do
    it 'postal_codeが空だと保存できないこと' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
    end
    it 'prefecture_idを選択していないと保存できないこと' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'cityが空だと保存できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @order_address.address = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが11桁以上では保存できないこと' do
      @order_address.phone_number = '090123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number Input only number")
    end
    it "tokenが空では保存できないこと" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it "user_idが空では購入できないこと" do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが空では購入できないこと" do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
    it "phone_numberは数字のみでないと登録できないこと" do
      @order_address.phone_number = 'a0901234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number Input only number")
    end
   end
  end
end
