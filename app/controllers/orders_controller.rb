class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:create, :index] 

  def index
    @order_address = OrderAddress.new
  end

  def create
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

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency: 'jpy' 
    )
  end

  def move_to_index
    if @item.order.present? || @item.user_id == current_user.id
      redirect_to root_path
    end 
  end 
end
