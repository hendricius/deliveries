Rails.application.routes.draw do
  resources :drivers
  resources :orders

  get "dashboard", to: "companies#dashboard", as: "dashboard"
  root 'static#home'

  resources :user_sessions
  resources :companies

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
