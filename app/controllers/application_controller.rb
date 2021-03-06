class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_filter :require_login
  require 'will_paginate/array' 
  
  private

  def require_login
    unless current_user
      redirect_to signin_path
    end
  end
  
  def get_current_user
    current_user
  end
  
end
