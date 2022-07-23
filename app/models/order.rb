class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  def address_display
  '〒' + postal_code + ' ' + address + ' '
  end

  # def total_payment
  #   order.total + order.shipping_cost
  # end

  enum payment_method: { credit_card: 0, transfer: 1 }

end
