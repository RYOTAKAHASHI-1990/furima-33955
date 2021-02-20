require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

   context "商品出品ができる場合" do
     it 'image、name、description、caregory_id、conditon_id、shipping_cost_id、prefecture_id、shipping_day_id、priceが共存すれば登録できる' do
       expect(@item).to be_valid
     end
   end
   context '商品出品ができないとき' do
     it 'imageが空では登録できない' do
       @item.image = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Image can't be blank")
     end
     it 'nameが空では登録できない' do
       @item.name = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Name can't be blank")
     end
     it 'descriptionが空では登録できない' do
       @item.description = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Description can't be blank")
     end
     it 'category_idが空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
     end
     it 'condition_idが空では登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
     end
     it 'shipping_cost_idが空では登録できない' do
      @item.shipping_cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost must be other than 1")
     end
     it 'prefecture_idが空では登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
     end
     it 'shipping_day_idが空では登録できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
     end
     it 'priceが半角数字以外では登録できない' do
      @item.price = "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
     end
     it 'priceが299以下では登録できない' do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
     end
     it 'priceが10000000以上では登録できない' do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
     end
   end
  end
end
