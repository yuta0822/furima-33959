class ItemsController < ApplicationController


  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
  end
  
end
