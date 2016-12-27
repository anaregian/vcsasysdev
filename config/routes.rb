Rails.application.routes.draw do
	
	# Sets the root page as the welcome page
	root 'welcome#home'
	# Initializes all the routes for positions
	resources :positions
	# Initializes all the routes for activities
	resources :activities
	# Initializes all the routes for components
	resources :components
	# Initializes all the routes for incomes
	resources :incomes
	# Initializes all the routes for estimations
	resources :estimations
	# Initializes all the routes for memos
	resources :memos

	# Initializes all the routes for users
	get 'signup', to: 'users#new'
	resources :users, except: [:new]

	# Initializes all the routes for the user sessions (log in, log out)
	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'

  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
