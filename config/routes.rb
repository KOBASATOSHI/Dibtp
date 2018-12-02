Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  root 'pages#index'
  get 'pages/show'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'users#new'
  resources :task_masters, :users
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/main',    to: 'static_pages#main'
end
