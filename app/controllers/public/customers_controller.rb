class Public::CustomersController < ApplicationController
  
  def after_sign_in_path_for(resource)
    my_page_path(current_customer.id)
  end
  
  def show
  
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
