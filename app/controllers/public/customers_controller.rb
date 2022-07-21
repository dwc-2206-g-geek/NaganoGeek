class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!, except: [:top, :about]



  def show

  end

  def edit
    @customer = current_customer.id
  end

  def update
    @customer = current_customer.id
      if @customer.update(customer_params)
      flash[:notice] = "You have Update User successfully."
      redirect_to my_page_path(@user.id)
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
    params.require(:ustomer).permit(:name, :profile_image, :introduction)
  end



end
