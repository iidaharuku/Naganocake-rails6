class CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.end_user_id = current_end_user.id
    if @cart_item.save
      redirect_to admin_items_path
    else
      @item = Item.find(params[:id])
      @item_cost = @item.tax_free_cost*1.08.to_i
      render template: "items/show"
    end
  end

  def index
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

end