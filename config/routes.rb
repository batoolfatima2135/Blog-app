Rails.application.routes.draw do
 
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: [:index, :show] do
      resources :posts do
        resources :comments,  only: [:new, :create, :destroy]
        resources :likes,  only: [:create] 
      end
  end

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :users, only: [:index, :show] do
        resources :posts, only: [:index]
      end
      resources :posts do
          resources :comments,  only: [:index, :create]
      end
    end
  end
end
