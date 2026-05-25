class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

helper_method :current_chef, :logged_in? , :authorized_for_recipecrud? , :authorized_for_chefcrud? , :authorized_for_admin?

  def current_chef
    @current_chef ||= Chef.find_by(id: session[:chef_id]) if session[:chef_id]
  end

  def logged_in?
    current_chef.present?
  end

  def require_login
    unless logged_in?
      redirect_to login_path, alert: "You must be logged in to access this section."
    end
  end

  def authorized_for_recipecrud?(recipe)
    recipe.chef_id == current_chef&.id
  end

  def authorized_for_chefcrud?(chef)
    logged_in? && chef.id == current_chef&.id
  end

  def authorized_for_admin?
    logged_in? && current_chef.admin?
  end

end



