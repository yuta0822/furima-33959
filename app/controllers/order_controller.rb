class OrderController < ApplicationController

  def index
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def address_params
    params.require(:order_address)permit(:post_code, :prefecture_id, :home_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
