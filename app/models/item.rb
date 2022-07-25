class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  has_one_attached :image

  validates :name, presence: true
  validates :genre_id, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, presence: true

  def add_tax_price
    (self.price * 1.10).floor
  end

  # 税込み単価の算出,item.rbに記載が好ましい
  def with_tax_price
      (price * 1.1).floor
  end

end
