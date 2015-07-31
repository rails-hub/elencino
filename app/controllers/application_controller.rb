class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

  protected

  def is_admin
    redirect_to root_path unless current_user.has_role? :admin
  end

  def is_admin_or_manager
    unless current_user.has_role? :admin
      unless current_user.has_role? :manager
        redirect_to root_path
      end
    end
  end

  def is_admin_or_manager_or_salesman
    unless current_user.has_role? :admin
      unless current_user.has_role? :manager
        unless current_user.has_role? :salesman
          redirect_to root_path
        end
      end
    end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
  end

  def layout_by_resource
    if devise_controller?
      'admin'
    else
      'application'
    end
  end


end
