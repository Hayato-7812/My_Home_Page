Rails.application.routes.draw do
  root 'admin/administrator#index'

  resources :sessions, only: [:new, :create, :destroy]

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :admins do
    resources :administrator, only: [:index]
  end
end
