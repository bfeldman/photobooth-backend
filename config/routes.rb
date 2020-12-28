Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :update]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/users/:username', to: 'users#find_user'
      resources :photos, only: [:show, :create, :update, :destroy]
      resources :comments, only: [:create, :destroy]
      resources :albums, only: [:show, :create, :update, :destroy]
    end
  end
end
