class CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.end_user_id = current_end_user.id
    
    @item_id = CartItem.find_by(item_id: params[:cart_item][:item_id])
    if @item_id == @cart_item.item_id
      @cart_item_update = CartItem.find(@item_id)
      amount = @cart_item_update.amount
      @cart_item_update.amount = amount + @cart_item.amount
      @cart_item_update.update(cart_item_params)
    elsif @cart_item.save
      redirect_to cart_items_path
    else
      @item = Item.find(@cart_item.item_id)
      @item_cost = @item.tax_free_cost*1.08.to_i
      render template: "items/show"
    end
  end

  def index
    @cart_items = CartItem.all
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

end