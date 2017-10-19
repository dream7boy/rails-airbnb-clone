Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'pages#home'
  resources :users, only: [ :show, :update ] do
    resources :bookings, only: [ :index, :show]
  end
  resources :pets, only: [:index, :show, :new, :create] do
    resources :bookings, only: [ :new, :create ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
