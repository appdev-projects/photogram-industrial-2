Rails.application.routes.draw do
  resources :photos
  root "photos#index"
  devise_for :users

end
