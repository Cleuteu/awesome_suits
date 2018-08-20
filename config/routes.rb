Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :suits, only: [:index, :show, :new, :create]

  namespace :owner do
    resources :suits
  end
end
