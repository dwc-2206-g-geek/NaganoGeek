class Admin::OrdersController < ApplicationController

  def show

  end

  def update
    if @status.update(status_params)
      redirect_to admin_form_inquiry_path(@status), notice: "受注ステータスを更新しました"
    else
      render :show, alert: "受注ステータスを更新できませんでした"
    end
  end

end
