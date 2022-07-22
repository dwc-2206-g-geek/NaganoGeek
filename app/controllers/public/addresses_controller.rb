class Public::AddressesController < ApplicationController

  def index
<<<<<<< HEAD
    @addresses = Address.all
    @address = Address.new
=======
>>>>>>> origin/develop

  end

  def edit
<<<<<<< HEAD
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
      render :index
    end
=======

  end

  def create
    @adress = Adress.new(adress_params)
    if @adress.save
      # redirect_to adresses_url(id: current_user.id)
      redirect_to adresses_path
    else
      render 'new'

>>>>>>> origin/develop
  end

  def update

  end

  def destroy
<<<<<<< HEAD
    @addresses = Address.all
    @address = Address.find(params[:id])
    if @address.customer != current_customer
      redirect_to  address_path
    else
      @address.destroy
      # flash[:notice] = "Address was successfully destroyed."
      redirect_to addresses_path
    end
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :postal_code, :address, :name)
=======

  end

  private
  def adress_params
    params.require(:adress).permit(:customer_id, :postal_code, :address, :name)
>>>>>>> origin/develop
  end

end
