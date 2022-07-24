class Admin::HomesController < ApplicationController
  
  def top
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

end
