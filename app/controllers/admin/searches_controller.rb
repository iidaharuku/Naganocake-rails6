class Admin::SearchesController < ApplicationController

  def search
    @word = params[:name]
    @items = Item.where(name: @word)
    render  template: "admin/items/index"
  end
end
