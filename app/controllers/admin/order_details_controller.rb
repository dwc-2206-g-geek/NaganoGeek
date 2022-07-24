class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to request.referer

    # making_status
    # if @form_inquiry.update(form_inquiry_params)
    #   redirect_to admin_form_inquiry_path(@form_inquiry), notice: "製作ステータスを更新しました"
    # else
    #   render :show, alert: "製作ステータスを更新できませんでした"
    # end
  end

private

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :name, :price, :amount, :making_status, :created_at)
  end

end
