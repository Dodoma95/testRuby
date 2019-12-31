Rails.application.routes.draw do

  resources :comments
  resources :users
  root "welcome#home"
  get "about" => "welcome#about"

  resources :articles

  get 'signup' => 'users#new'
  post 'users' => 'users#create'
  resources :users, except: [:new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
