class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :comment]) 
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :comment])
  end

  def after_sign__path_for(resource)
    root_path(resource)
  end
  
  def set_search
    @search = Room.ransack(params[:q]) 
    @search_rooms = @search.result
  end

end
