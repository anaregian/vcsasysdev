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
<<<<<<< HEAD
	# Initializes all the routes for password_resets
	resources :password_resets
	# Initializes all the routes for admin_codes
	resources :codes ,:path => "secret_page", except: [:show]
=======
	# Initializes all the routes for memos
	resources :memos
	# Initializes all the routes for comments
	resources :comments

>>>>>>> e8e5446c0d0343e3d4649b6d8102bc2e14f9d94f
	# Initializes all the routes for users
	get 'signup', to: 'users#new'
	resources :users , except: [:new] do
		member do
			get :confirm_email
		end
	end

	# Initializes all the routes for the user sessions (log in, log out)
	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'

  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
