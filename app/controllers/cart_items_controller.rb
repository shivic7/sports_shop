class CartItemsController < CustomerController
  before_action :authenticate_customer!
  before_action :set_cart_item, only: [:update, :destroy]

  def create
    cart = current_user.cart || Cart.create(customer: current_user)
    product = Product.find(params[:product_id])
    customization_options = params[:customization_options].permit!.to_h

    total_price = product.base_price
    customization_options.each_value do |part_id|
      part = Part.find(part_id)
      total_price += part.price
    end

    # Check combinations and apply additional prices
    customization_options.each do |category, part_id|
      condition_part = Part.find(part_id)
      customization_options.each do |other_category, other_part_id|
        next if category == other_category

        combination = Combination.find_by(condition_part: condition_part, affected_part: Part.find(other_part_id))
        if combination
          if combination.allowed
            total_price += combination.additional_price || 0
          else
            flash[:alert] = "The combination of #{condition_part.name} and #{Part.find(other_part_id).name} is not allowed."
            redirect_to "/products/show?id=#{product.id}" and return
          end
        end
      end
    end

    cart_item = cart.cart_items.create!(
      product: product,
      quantity: 1,
      customization_options: customization_options,
      price: total_price
    )

    redirect_to carts_show_path(cart)
  end

  def update
    if @cart_item.update(cart_item_params)
      redirect_to carts_show_path, notice: 'Cart updated.'
    else
      redirect_to carts_show_path, alert: 'Unable to update cart.'
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to carts_show_path, notice: 'Item removed from cart.'
  end

  private

  def set_cart_item
    @cart_item = current_customer.cart.cart_items.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity, customization_options: {})
  end

end
