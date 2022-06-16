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
  
#   private
#   def item_params
#     params(:item).require(:)
end
