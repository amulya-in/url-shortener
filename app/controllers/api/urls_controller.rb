module Api
	class UrlsController < ApplicationController
		before_action :authenticate 
		protect_from_forgery :except => [:create]
		
		def index
			@urls = @user.urls
			render json: @urls
		end	

		def create
			@user.urls.create(url_params) 
			render json: @user.urls
		end
		
		def show
			@url = @user.urls.find(params[:id])
			render json: @url
		end

		def destroy
			@user.urls.destroy(params[:id])
			render json: { message: "URL destroyed successfully!"}
		end

		private
			def authenticate
    		authenticate_token || render_unauthorized
  		end

			def authenticate_token
				authenticate_with_http_token do |token, options|
    			@user = User.find_by(api_key: token)
    		end
			end
		  
		  def render_unauthorized
		    render json: 'Bad credentials', status: 401
		  end

		  def url_params
		  	params.permit(:original)
		  end		
	end
end	