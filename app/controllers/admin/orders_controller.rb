class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
    # sum = 0
    # order.order_detail.each  do |order|
    # sum += order.amount

  end

  def show
    @order = Order.find(params[:id])
    @order_details =OrderDetail.where(order_id: @order.id)
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
  end
  private
  def order_params
    params.require(:order).permit(:status)
  end
  
end
