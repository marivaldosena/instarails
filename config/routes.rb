Rails.application.routes.draw do
  devise_for :users
  root 'pics#index'

  resources :pics
end
