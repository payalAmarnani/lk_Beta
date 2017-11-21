class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order
  # devise_group :user, contains: [:agent, :company] 
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :salutation, :surname, :company_name, :position, :email_address, :username, :email, :password, :password_confirmation) }
  end
  
end
