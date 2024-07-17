class Admin::CombinationsController < AdminController
  before_action :authenticate_admin_user!
  load_and_authorize_resource

  def index
    @combinations = Combination.all
  end

  def new
    @combination = Combination.new
    @parts = Part.all
  end

  def create
    @combination = Combination.new(combination_params)
    if @combination.save
      redirect_to admin_combinations_index_path
    else
      flash[:alert] = 'Combination not created'
      redirect_to admin_combinations_new_path
    end
  end

  def update
    @combination = Combination.find(params[:id])
    if @combination.update(combination_params)
      redirect_to admin_combinations_index_path
    else
      redirect_to admin_combinations_new_path(@combination)
    end
  end

  private

  def combination_params
    params.require(:combination).permit(:condition_part_id, :affected_part_id, :allowed, :additional_price)
  end
end
