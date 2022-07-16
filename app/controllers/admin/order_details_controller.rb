class Admin::OrderDetailsController < ApplicationController

  def update
    @detail = OrderDetail.find(params[:id])
    @detail.update(detail_params)
    if @detail.create_status == "produce"
      @detail.order.update(status: 2)
    end
    if @detail.create_status == "finish"
      @details = OrderDetail.where(order_id: @detail.order_id)
      @details.each do |detail|
        if detail.create_status != "finish"
          redirect_to admin_order_path(@detail.order_id) and return
        end
      end
      @detail.order.update(status: 3)
    end
    redirect_to admin_order_path(@detail.order_id)
  end

  private
  def detail_params
    params.require(:order_detail).permit(:create_status)
  end
end
