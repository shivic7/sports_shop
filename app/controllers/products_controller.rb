class ProductsController < CustomerController
  before_action :authenticate_customer!

  def index
    @products = Product.active.all
  end

  def show
    @product = Product.find(params[:id])
    @parts = Part.where("stock > 0").group_by(&:category)
  end
end
