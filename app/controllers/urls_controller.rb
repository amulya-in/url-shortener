class UrlsController < ApplicationController
	before_action :confirm_login, except: [:redirect]
  
  def new
  	@user = current_user
  	@url = @user.urls.build
  end

  def create
  	@user = current_user
  	@url = @user.urls.build(url_params)
  	if @url.save!
  		flash[:notice] = "Url Shortened Successfully!"
  		redirect_to user_path(@user)
  	else
  		flash[:notice] = "Please, try again"
  		redirect_to new_user_url_path(@user)
  	end
  end	

  def destroy
  end

  def redirect
    url = Url.find_by(key: params[:key])
    redirect_to url.original, status: 301 and return if url
    redirect_to root_url
	end  	

  private
  	def url_params
  		params.require(:url).permit(:original)
  	end	

  	def confirm_login
  		redirect_to root_path unless User.find(params[:user_id]) == User.find(session[:user_id])  
  	end

  	def current_user
  		User.find(session[:user_id])
  	end	
end
