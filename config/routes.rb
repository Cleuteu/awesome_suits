Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/suits/owner', to: 'suits#owner_index', as: 'owner_index'

  resources :suits, only: [:index, :show, :new, :create, :destroy]

  namespace :owner do
    resources :suits
  end
end
