class CustomerController < ApplicationController
  def current_user
    @current_user = current_customer
  end
end
  