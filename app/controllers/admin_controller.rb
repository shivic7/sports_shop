class AdminController < ApplicationController
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to admin_products_index_path, alert: exception.message
  end
  
  def current_user
    @current_user = current_admin_user
  end
end
