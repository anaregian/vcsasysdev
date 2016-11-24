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

  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
