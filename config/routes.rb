Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/suits/owner', to: 'suits#owner_index', as: 'owner_index'

  resources :suits do
    resources :rentings, only: [:create]
  end

  resources :rentings, only: [:index, :show, :destroy] do
    resources :reviews, only: [:create]
    resources :messages, only:[:create, :show]
  end

  resources :reviews, only: [:show, :destroy]
end
