class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  @current_modulo = nil
end
