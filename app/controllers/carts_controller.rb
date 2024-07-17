class CartsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart

  def show
  end

  private

  def set_cart
    @cart = current_customer.cart
  end
end
