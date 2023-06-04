Rails.application.routes.draw do
  get 'page/home'
  devise_for :users, controllers: { registrations: 'users/registrations', passwords: 'users/passwords', sessions: 'users/sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "page#home"
  get '/home', to: 'page#home'
  get 'downloads/csv', to: 'downloader#csv', as: 'downloader_csv'
  get 'downloads/pdf', to: 'downloader#pdf', as: 'downloader_pdf'
  get '/libraries/:id/download_report', to: 'downloader#pdf_library', as: 'downloader_pdf_library'
  get '/users/:id/download_report', to: 'downloader#pdf_user', as: 'downloader_pdf_user'
  resources :authors, :genres, :libraries, :users, :books, :library_cards
end
