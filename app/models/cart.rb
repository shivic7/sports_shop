class Cart < ApplicationRecord
  belongs_to :customer
  has_many :cart_items

  def total_price
    cart_items.joins(:product).inject(0) { |sum, item| sum + (item.product.disabled ? 0 : item.price) }
  end
  
end
