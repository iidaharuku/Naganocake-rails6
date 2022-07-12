class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def complete
      @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    
    @cart_items = CartItem.where(end_user_id: current_end_user)
    @sum = 0
    @cart_items.each  do |cart_item|
      @sum += (cart_item.item.tax_free_cost*1.08).to_i * cart_item.amount
    end
    @order.total_cost = @sum
    if @order.postal_code == 0
      @order.postal_code = current_end_user.postal_code
      @order.send_address = current_end_user.address
      @order.address_name = current_end_user.last_name + current_end_user.first_name
    elsif @order.postal_code == 1
      order_address = Address.find_by(id: postage)
      @order.postal_code = order_address.postal_code
      @order.send_address = order_address.place
      @order.address_name = order_address.name
    end
      
  end

  def index
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:payway, :postal_code, :postage)
  end
end
