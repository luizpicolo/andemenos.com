require 'application_responder'

# Class Appllication
class ApplicationController < ActionController::Base
  # before_filter :require_http_basic_auth if Rails.env.production?

  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_http_basic_auth
    authenticate_or_request_with_http_basic do |login, password|
      login == 'andemenos' && password == 'andemenos153'
    end
  end
end
