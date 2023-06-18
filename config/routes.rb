Rails.application.routes.draw do
  resources :comments
  resources :photos
  root "photos#index"
  devise_for :users

end
