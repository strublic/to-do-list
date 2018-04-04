Rails.application.routes.draw do
  # resources :favorites
  resources :lists
  devise_for :users
  resources :tasks
  root 'home#index'
  get 'set_favorites' => 'lists#set_favorites'
  get 'favorites' => 'lists#favorites'
  get "change_status" => 'tasks#change_status'

end
