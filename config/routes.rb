Rails.application.routes.draw do
  devise_for :users
  root "home#inicio"
  resources :posts
end
