class Admin::PartsController < AdminController
  before_action :authenticate_admin_user!
  load_and_authorize_resource

  def index
    @parts = Part.all
  end

  def new
    @part = Part.new
  end

  def create
    @part = Part.new(part_params)
    if @part.save
      redirect_to admin_parts_index_path
    else
      render :new
    end
  end

  def edit
    @part = Part.find(params[:id])
  end

  def update
    @part = Part.find(params[:id])
    if @part.update(part_params)
      redirect_to admin_parts_index_path
    else
      render :edit
    end
  end

  private

  def part_params
    params.require(:part).permit(:name, :category, :price, :stock)
  end
end
