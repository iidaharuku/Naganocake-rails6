class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @item_cost = @item.tax_free_cost*1.08.to_i
    @cart_item = CartItem.new
    @cart_item.item_id = @item.id 
  end
end
