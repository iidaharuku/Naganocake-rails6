class Admin::OrderDetailsController < ApplicationController

  def update
    @detail = OrderDetail.find(params[:id])
    @detail.update(detail_params)
    redirect_to admin_order_path(@detail.order_id)
  end

  private
  def detail_params
    params.require(:order_detail).permit(:create_status)
  end
end
