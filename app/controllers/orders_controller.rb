class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.where(end_user_id: current_end_user)
    @sum = 0
    @cart_items.each  do |cart_item|
      @sum += (cart_item.item.tax_free_cost*1.08).to_i * cart_item.amount
    end
    if @order.total_cost == 0
      @order.postal_code = current_end_user.postal_code
      @order.send_address = current_end_user.address
      @order.address_name = current_end_user.last_name + current_end_user.first_name
    elsif @order.total_cost == 1
      order_address = Address.find_by(id: postage)
      @order.postal_code = order_address.postal_code
      @order.send_address = order_address.place
      @order.address_name = order_address.name
    end
    @order.total_cost = @sum + 800
  end

  def complete
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    if @order.save
      @order.update(status: 1)
    else
      render :confirm
      
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:pay_way, :postal_code, :postage, :send_address, :address_name, :total_cost)
  end
end
