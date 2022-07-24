class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @total = 0
    @order.order_details.each do |order_detail|
      @total += (order_detail.price * 1.1).floor
    end
    @total_payment = @total + @order.shipping_cost.to_i
    @order_details = @order.order_details

  end

  def update
    # @order = Order.find(params[:id])
    # if @order.update(status_params)
    #   redirect_to request.referer, notice: "受注ステータスを更新しました"
    # else
    #   redirect_to request.referer, alert: "受注ステータスを更新できませんでした"
    # end

    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to request.referer

  end


  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status, :created_at)
  end


end
