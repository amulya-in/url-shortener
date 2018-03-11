class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:notice] = "Invalid Email/Password combination"
      redirect_to new_session_path  
    end 
  end

  def destroy
    reset_session
    redirect_to root_path
  end 
end
