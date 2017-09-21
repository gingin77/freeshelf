class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    user = User.find_by(username: params[:username])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    end
  end
end
