class Public::AddressesController < ApplicationController

  def index

  end

  def edit

  end

  def create
    @adress = Adress.new(adress_params)
    if @adress.save
      # redirect_to adresses_url(id: current_user.id)
      redirect_to adresses_path
    else
      render 'new'

  end

  def update

  end

  def destroy

  end

  private
  def adress_params
    params.require(:adress).permit(:customer_id, :postal_code, :address, :name)
  end

end
