class OrdersController < ApplicationController
  def new
    @order = Order.new
    @cart_items = CartItem.where(end_user_id: current_end_user)
    if @cart_items.empty? then
      redirect_to cart_items_path
    end
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.where(end_user_id: current_end_user)
    if @cart_items.empty? then
      redirect_to cart_items_path
    end
    if params[:order][:pay_way] == "0"
      @order.pay_way = 0
    elsif params[:order][:pay_way] == "1"
      @order.pay_way = 1
    end
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
    @cart_items = CartItem.where(end_user_id: current_end_user)
    @order = Order.new(order_params)
    if @cart_items.empty? then
      redirect_to cart_items_path
    end
    if params[:order][:pay_way] == "0" or "credit_card"
      @order.pay_way = 0
    elsif params[:order][:pay_way] == "1" or "transfer"
      @order.pay_way = 1
    end
    @order.end_user_id = current_end_user.id
    @order.postage = 800
    if @order.save
    else
      @sum = 0
      @cart_items.each  do |cart_item|
        @sum += (cart_item.item.tax_free_cost*1.08).to_i * cart_item.amount
      end
      render :confirm
    end

    @cart_items = CartItem.where(end_user_id: current_end_user)
    @cart_items.each  do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.past_item_cost = (cart_item.item.tax_free_cost*1.08).to_i * cart_item.amount
      @order_detail.amount = cart_item.amount
      if @order_detail.save
        @cart_items.destroy_all
      # else
      #   @cart_items = CartItem.where(end_user_id: current_end_user)
      #   @sum = 0
      #   @cart_items.each  do |cart_item|
      #     @sum += (cart_item.item.tax_free_cost*1.08).to_i * cart_item.amount
      #   end
      #   render :confirm and return
      end
    end


  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :postage, :send_address, :address_name, :total_cost)
  end

end