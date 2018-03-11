class UsersController < ApplicationController
  
  def index
  end 

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Registration Successful, you may now login"
      redirect_to new_session_path
    else
      flash[:notice] = "Please check the information entered"
      redirect_to new_user_path
    end 
  end

  def show
    @user = User.find_by(id: session[:user_id])
    unless @user
      redirect_to new_session_path
    end   
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end 
end
