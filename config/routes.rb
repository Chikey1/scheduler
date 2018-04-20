Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'calendar#show'
  resources :users,          only: [:new, :create]
  resource :calendar,        only: [:show]
  resources :sessions,         only: [:new]

end
