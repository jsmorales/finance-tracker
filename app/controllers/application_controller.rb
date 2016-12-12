class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  ##autenticacion para cada acción de la aplicacion
  before_action :authenticate_user! 
end
