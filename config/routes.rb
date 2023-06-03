Rails.application.routes.draw do
  get 'page/home'
  devise_for :users, controllers: { registrations: 'users/registrations', passwords: 'users/passwords', sessions: 'users/sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "page#home"
  get '/home', to: 'page#home'
  resources :authors, :genres, :libraries, :users, :books, :library_cards
end
