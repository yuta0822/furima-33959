class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end 

  private
  def address_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :home_number, :building_name, :phone_number, :city).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
