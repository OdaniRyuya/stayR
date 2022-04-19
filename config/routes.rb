Rails.application.routes.draw do
  get 'reservations/index'
  devise_for :users, controllers: {  
  registrations: 'users/registrations',
  sessions: 'users/sessions' }
  root 'top#index'
  get 'rooms/post'
  get 'rooms/search'
  get 'reservations/completed'
  get "search" => "rooms/search"
  resources :rooms
  resources :reservations
end
