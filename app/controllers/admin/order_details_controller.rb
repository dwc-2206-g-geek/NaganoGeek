class Admin::OrderDetailsController < ApplicationController

  def update
    if @form_inquiry.update(form_inquiry_params)
      redirect_to admin_form_inquiry_path(@form_inquiry), notice: "対応ステータスを更新しました"
    else
      render :show, alert: "対応ステータスを更新できませんでした"
    end
  end

end
