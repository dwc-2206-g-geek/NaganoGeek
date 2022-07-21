class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!, except: [:top, :about]



  def show

  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
      if @customer.update(customer_params)
      flash[:notice] = "You have Update User successfully."
      redirect_to my_page_path
      else
      render :edit
      end

  end



  def unsubscribe

  end

  def withdraw

  end

    private

  def customer_params
    params.require(:customer).permit(:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number)
  end



end
