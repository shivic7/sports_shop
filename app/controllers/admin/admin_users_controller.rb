class Admin::AdminUsersController < AdminController

  before_action :authenticate_admin_user!
  load_and_authorize_resource

  def index
    @admin_users = AdminUser.all
  end

  def show
    @admin_user = AdminUser.find(params[:id])
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)
    if @admin_user.save
      redirect_to admin_admin_users_path, notice: 'Admin user was successfully created.'
    else
      redirect_to admin_admin_users_path, alert: 'Admin user not created.'
    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update(admin_user_params)
      redirect_to edit_admin_admin_user_path(@admin_user), notice: 'Admin user was successfully updated.'
    else
      redirect_to edit_admin_admin_user_path(@admin_user), alert: 'Admin user not updated successfully.'
    end
  end

  def destroy
    @admin_user = AdminUser.find(params[:id])
    @admin_user.destroy
    redirect_to admin_admin_users_path, notice: 'Admin user was successfully deleted.'
  end

  private

  def admin_user_params
    params.require(:admin_user).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
  