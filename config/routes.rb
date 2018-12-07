Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  root 'pages#index'
  get 'pages/show'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :to_do_groups, shallow: true do
   resources :to_do_masters
 end
  # root 'users#new'
  resources :to_do_groups, shallow: true do
    resources :to_do_masters
  end
  resources :users
  get    '/main',    to: 'static_pages#main'
end
