Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  root 'pages#index'
  get 'pages/show'

  devise_scope :user do
  get :sign_in, to: 'devise/sessions#new', as: :new_user_session
  delete :sign_out, to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  
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
  # root 'users#new'
  resources :to_do_groups, shallow: true do
    resources :to_do_masters
  end
  resources :users
  resources :to_dos, only:[:update]
  get    '/main',    to: 'static_pages#main'
end
