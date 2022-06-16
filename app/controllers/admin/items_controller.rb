class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end
  

  def show
  end

  def edit
  end
  
  # private
  # def item_params
  #   params.require(:item).permit(:genre_id, :name, :explanation, :tax_free_cost, :stock_status)
  # end
end
