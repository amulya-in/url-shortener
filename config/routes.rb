Rails.application.routes.draw do
  
  root 'users#index'
  
  resources :users, only: [:new, :create, :show] do
  	resources :urls, only: [:new, :create, :destroy]
	end

	resources :sessions, only: [:new, :create, :destroy]
	
  get '/:key', to: "urls#redirect"

  namespace :api, defaults: {format: 'json'} do
  	resources :urls, only: [:index, :create, :show, :destroy]
  end	
end
