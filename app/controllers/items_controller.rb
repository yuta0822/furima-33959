class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, except: [:index, :show]
 

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path
    else
      render :show
    end
  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to items_path
    end
  end

  def update
    if @item.update(item_params)
       redirect_to item_path
    else
      render :edit
    end
  end

  def show
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id, :prepare_id, :price,:image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless @item.user_id == current_user.id
     redirect_to action: :index
    end 
  end 
end
