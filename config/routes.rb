Rails.application.routes.draw do
  root "photos#index"


  devise_for :users

  resources :likes
  resources :follow_requests
  resources :comments
  resources :photos
  resources :users, only: :show

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
