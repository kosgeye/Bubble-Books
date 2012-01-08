BooksBubble::Application.routes.draw do
  resources :books

  get "sessions/new"

  get "users/new"
   resources :users
   resources :sessions, :only => [:new, :create, :destroy]

  match '/signup',	:to => 'users#new'
  match '/contact', :to => 'pages#contact'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'

  root :to => 'pages#home'
end
