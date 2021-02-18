require 'rails_helper'

  RSpec.describe OrderAddress, type: :model do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address,user_id: @user.id,item_id: @item.id)
      sleep(0.5)
    end
    

    describe '住所登録' do
      context '住所正しく入力できるとき' do
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@order_address).to be_valid
        end
        it 'building_nameは空でも保存できること' do
          @order_address.building_name = ''
          expect(@order_address).to be_valid
        end
      end  

      context '住所正しく入力できない時' do
        it 'post_codeが空だと保存できないこと' do
          @order_address.post_code = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Post code can't be blank")
        end
        it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @order_address.post_code = '1234567'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
        end
        it 'prefecture_idを選択していないと保存できないこと' do
          @order_address.prefecture_id = 1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
        end
        it 'cityは空だと保存できないこと' do
          @order_address.city = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end
        it 'home_numberは空だと保存できないこと' do
          @order_address.home_number = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Home number can't be blank")
        end
        it 'phone_numberは空だと保存できないこと' do
          @order_address.phone_number = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberは12桁以上だと保存できないこと' do
          @order_address.phone_number = '123456789012'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is within 11 digits and only numbers")
        end
        it 'phone_numberは英数混合だと保存できないこと' do
          @order_address.phone_number = '123abc'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is within 11 digits and only numbers")
        end
        it 'user_idは空だと保存できないこと' do
          @order_address.user_id = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idは空だと保存できないこと' do
          @order_address.item_id = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end
        it 'tokenは空だと保存できないこと' do
          @order_address.token = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end