class OrderController < ApplicationController

  def index
  end

  def new
  end

  def create
    @order = Order.create(order_params)
    Address.create(address_params)
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order)permit(:item).merge(user_id: current_user.id)
  end

  def address_params
    params.require(:address)permit(:post_code, :prefecture_id, :home_number, :building_name, :phone_number).merge(item_id: @item.id)
  end

end
