class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

validates :amount, include(1..10)

  # 小計の算出
  def subtotal
      item.with_tax_price * amount
  end
end



