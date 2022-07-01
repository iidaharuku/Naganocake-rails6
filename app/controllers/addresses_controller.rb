class AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    if @address.save
      redirect_to addresses_path
    else
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :place, :name)
  end
end
