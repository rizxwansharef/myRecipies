class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  stale_when_importmap_changes
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
helper_method  :authorized_for_recipecrud?, :authorized_for_chefcrud?, :authorized_for_admin?

 
  

  def authorized_for_recipecrud?(recipe)
    recipe.chef_id == current_chef&.id
  end

  def authorized_for_chefcrud?(chef)
    chef_signed_in? && chef.id == current_chef&.id
  end

  def authorized_for_admin?
    chef_signed_in? && current_chef.admin?
  end
end
