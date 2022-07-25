class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    if @order_detail.update(order_detail_params)

      # @order_details.making_status == 2 if @order.update(status: 2)
      redirect_to request.referer
    # elsif @order.update(status: 2) if @order_detail.making_status == 3
    # elsif @order_detail.update(order_detail_params)
    # @order_detail.update(making_status: 2) if @order.update(status: 2)


    else
      redirect_to request.referer
    end
  end

private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status, :created_at)
  end

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :name, :price, :amount, :making_status, :created_at)
  end

end
