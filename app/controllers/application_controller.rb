class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # before_action do
  #   @current_user = User.find(session[:id])
  # end

  # def authenticate_user!
  #   if user_signed_in? != true
  #     redirect_to books_path
  #   end
  # end
  #
  # def user_signed_in?
  #   @current_user.present?
  # end
  #
  # private
  #   def current_user
  #     User.find(session[:user_id])
  #   end
end
