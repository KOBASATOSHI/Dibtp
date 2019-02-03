Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  
  root 'pages#index'
  get 'pages/show'
  get 'pages/get_to_dos'
  resources :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :to_do_groups, shallow: true do
   collection do
      get 'goal_index'
    end
    
    member do
      get :register, :release
    end
   resources :to_do_masters
 end
  resources :to_do_groups, shallow: true do
    resources :to_do_masters
  end

  resources :to_dos, only:[:update]
  resources :user_to_do_groups, only:[:update]
end
