Rails.application.routes.draw do
  resources :lists
  devise_for :users
  resources :tasks
  root 'home#index'
  get 'favorites' => 'lists#favorites'

end
