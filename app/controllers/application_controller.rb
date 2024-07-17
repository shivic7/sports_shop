class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: -> { Rails.env.development? }
  
  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)
      admin_products_index_path  
    elsif resource.is_a?(Customer)
      products_index_path
    end
  end

  def flash_alert(message)
    if flash[:alert]
      flash.keep(:alert)
    else
      flash[:alert] = message
    end
  end

end
