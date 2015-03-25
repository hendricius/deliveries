Rails.application.routes.draw do
  resources :orders

  match '*path' => 'static#home', via: [:get, :post]
  root 'static#home'
end
