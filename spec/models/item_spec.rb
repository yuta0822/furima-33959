require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録できるとき' do
     it 'name,explanation,price,category_id,condition_id,postage_id,prefecture_id,prepare_id,imageの入力で登録' do
       expect(@item).to be_valid
     end
   end

  context '商品登録できないとき' do 
    it 'imageが空でも保存できない' do
     @item.image = nil
     @item.valid?
     expect(@item.errors.full_messages).to include("Image can't be blank")
   end

    it "商品名前がない場合は登録できないこと" do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "説明文がない場合は登録できないこと" do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it "category_id(カテゴリーの選択)がない場合は登録できないこと" do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "condition_id(商品の状態)の選択がない場合は登録できないこと" do
      @item.condition_id = '1' 
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it "postage_id(発送料の負担)の選択がない場合は登録できないこと" do
      @item.postage_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage must be other than 1")
    end

    it "prefecture_id(発送元の地域)の選択がない場合は登録できないこと" do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "prepare_id(発送までの日数)の選択がない場合は登録できないこと" do
      @item.prepare_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prepare must be other than 1")
    end

    it "price(価格)の入力がない場合は登録できないこと" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end

    it "price(値段)が300以下であれば登録できないこと " do
      @item.price = '299' 
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end
    end
  end
end