class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(user)
    return admin_path
  end

  def status
    current_user.status
  end

  def only_for(role)
    unless role == current_user.status
      redirect_to root_path, notice: "Not authorized."
    end
  end

  helper_method :status, :session
end
