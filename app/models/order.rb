class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  def address_display
  '〒' + postal_code + ' ' + address
  end


  enum payment_method: { credit_card: 0, transfer: 1 }


end
