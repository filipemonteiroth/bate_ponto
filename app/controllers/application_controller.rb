class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout

  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to permission_denied_path, :alert => exception.message
  end

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  private
    def layout
      devise_controller? ? "login" : "application"
    end
end
