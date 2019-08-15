Rails.application.routes.draw do
  devise_for :users
  	resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'books#index'
   	get "books/:id/move_up" => 'books#move_up'
   	get "books/:id/move_down" => 'books#move_down'
end
