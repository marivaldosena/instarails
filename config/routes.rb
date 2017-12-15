Rails.application.routes.draw do
  devise_for :users

  root 'pics#index'

  resources :pics do
    member do
      put 'like', to: 'pics#upvote'
    end
  end
end
