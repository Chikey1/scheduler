Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'calendars#index'
  resources :users,          only: [:new, :create]
  resources :tasks,          only: [:new, :create, :show, :destroy]
  resources :activities,     only: [:new, :create, :show, :destroy]
  resources :events,          only: [:new, :create, :show, :destroy]
  get   '/profile',  to: 'users#index'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
