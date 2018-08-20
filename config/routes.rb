Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :smokings, only: [:index, :show]

  namespace :owner do
    resources :smokings
  end
end
