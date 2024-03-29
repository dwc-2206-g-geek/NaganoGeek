class Public::AddressesController < ApplicationController

  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
    unless @address.customer == current_customer
      redirect_to  addresses_path
    end
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
      # flash[:notice] = "Address was successfully created."
    else
      @customer = current_customer
       @addresses = Address.all
      redirect_to request.referer
    end
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    # flash[:notice] = "Address was successfully updated."
    redirect_to addresses_path
  end

  def destroy
    @addresses = Address.all
    @address = Address.find(params[:id])
    @address.destroy
    # flash[:notice] = "Address was successfully destroyed."
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :postal_code, :address, :name)
  end

end
