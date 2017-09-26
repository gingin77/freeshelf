class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      render 'new'
    end
  end
  # def sign_out
  #   reset_session
  #   redirect_to root_url
  # end
  #
  def destroy
    reset_session
    render 'log_out'
  end
end


# # Taken from console after submitting a username and password that was stored in the User db
  # Parameters: {
  #   "utf8"=>"✓", "authenticity_token"=>"bvDny5fV/L9TJcTyb8ptPpW7jINXHNfoYCwhAMaS5e3XMffy4z0YFpxsqtBTxq8ghH9zoE6u3uU3y4bilEuzMg==",
  #   "session"=>{
  #      "email"=>"ginnie@yahoo.com",
  #       "password"=>"[FILTERED]"
  #     },
  #   "commit"=>"Log in"
  # }

# Create method example from newline
  # def create
  #   user = User.find_by(name: params[:name])
  #   if user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect_to user
  #   else
  #     render 'new'
  #   end
  # end
