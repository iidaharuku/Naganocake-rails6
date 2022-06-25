class CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.end_user_id = current_end_user.id

    @item_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
    if @item_item
      if @cart_item.amount.present? == false
        @item = Item.find(@cart_item.item_id)
        @item_cost = @item.tax_free_cost*1.08.to_i
        render template: "items/show"
      else
        @item_item.update(amount: @cart_item.amount + @item_item.amount)
        redirect_to cart_items_path
    end
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

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      render :index
    end
  end
  def index
    @cart_items = CartItem.all
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

end