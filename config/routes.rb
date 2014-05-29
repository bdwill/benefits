Benefits::Application.routes.draw do

resources :account, :users, :office, :user_sessions, :search, :verify

resources :verify do
	member do
		get 'signoff'
		post 'signoff'
		get 'display_comment_form'
		post 'create_comment'
	end
	collection do
		get 'list_active'
		post 'list_active'
	end
end
root 'user_sessions#new'
get '/offices', 	to: 'office#index', via: 'get'
get '/benefits', to: 'verify#index'
post '/benefits', to: 'verify#index'


#map.resources :benefits, :controller => 'verify', 

#:member => { :signoff => [:get, :post], 
#:display_comment_form => :get, 
#:create_comment => :post }, 
#:collection => { :list_active => [:get, :post] } Fixed?
end
