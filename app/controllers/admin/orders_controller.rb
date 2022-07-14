class Admin::OrdersController < ApplicationController
  protect_from_forgery
  def index
    @orders = Order.all
    # sum = 0
    # order.order_detail.each  do |order|
    # sum += order.amount

  end

  def show
    @order = Order.find(params[:id])
    @order_details =OrderDetail.where(order_id: @order.id)

    @sum = 0
    @order_details.each  do |detail|
      @sum += detail.past_item_cost
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(@order)
    else
      @order_details =OrderDetail.where(order_id: @order.id)
      @sum = 0
      @order_details.each  do |detail|
        @sum += detail.past_item_cost
      end
      render :show
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:status)
  end

end
