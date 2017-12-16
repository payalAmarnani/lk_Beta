class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :store_user_location!, if: :storable_location?

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
    # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :salutation, :surname, :company_name, :position, :email_address, :username, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :salutation, :surname, :company_name, :position, :email_address, :username, :email, :password, :password_confirmation])
  end

  private
    # Its important that the location is NOT stored if:
    # - The request method is not GET (non idempotent)
    # - The request is handled by a Devise controller such as Devise::SessionsController as that could cause an 
    #    infinite redirect loop.
    # - The request is an Ajax request as this can lead to very unexpected behaviour.
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
    end

    def store_user_location!
      # :user is the scope we are authenticating
      store_location_for(:customer, request.fullpath)
    end
  
end
