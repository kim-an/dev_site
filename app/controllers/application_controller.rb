class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :is_client?, :is_agency?

  private

    def current_user
      if session[:client]
        @current_user ||= Client.find_by(id: session[:user_id]) if session[:user_id]
      else
        @current_user ||= Agency.find_by(id: session[:user_id]) if session[:user_id]
      end
    end

    def is_client?
      !session[:client].nil?
    end

    def is_agency?
      !session[:agency].nil?

    end
end
