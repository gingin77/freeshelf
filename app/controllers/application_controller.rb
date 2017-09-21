class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action do
  #   @current_user = User.find(session[:id])
  # end

  def create
    username = params[:user][:username]
    user_password = params[:user][:password]
    user = User.find_by_username(username).authenticate(user_password)
    session[:user_id] = user.id
    redirect_to root_url
  end

  def authenticate_user!
    if user_signed_in? != true
      redirect_to sign_in_path
    end
  end

  def user_signed_in?
    @current_user.present?
  end

  def sign_out
    reset_session
    redirect_to root_url
  end

  private
  def current_user
    User.find(session[:user_id])
  end
end
