class Admin::ProductsController < AdminController
  before_action :authenticate_admin_user!
  load_and_authorize_resource

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @parts = Part.all.group_by(&:category)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_index_path, notice: 'Product was successfully created.'
    else
      render :admin_products_new_path
    end
  end

  def edit
    @product = Product.find(params[:id])
    @parts = Part.all.group_by(&:category)
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to "/admin/products/index", notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :base_price, :disabled, part_ids: [])
  end
end
