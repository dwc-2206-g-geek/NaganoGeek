class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!, except: [:top, :about]

 

  def show
   
  end

  def update

  end
  
  def edit

  end

  def unsubscribe

  end

  def withdraw

  end



end
