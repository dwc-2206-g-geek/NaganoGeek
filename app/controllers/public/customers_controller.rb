class Public::CustomersController < ApplicationController
  
  before_action :authenticate_customer!, except: [:top, :about]
  
  def after_sign_in_path_for(resource)
    my_page_path(current_customer.id)
  end
  
  def show
  @customer = Customer.find(params[:id])
  
  end
  
  def edit
  
  end
  
  def update
  
  end
  
  def unsubscribe
  
  end
  
  def withdraw
  
  end
  
  
  
end
