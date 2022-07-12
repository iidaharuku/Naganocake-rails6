class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def complete
    
    
      
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
