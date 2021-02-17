class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end 

  private
  def address_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :home_number, :building_name, :phone_number, :city).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_c47dfc0be7871c73e5a4534d"
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency: 'jpy' 
    )
  end

end
