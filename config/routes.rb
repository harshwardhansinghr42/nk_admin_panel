Rails.application.routes.draw do
  # resources :product_comments
  # resources :products
  # resources :tags
  # resources :categories
  # resources :users
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :registrations, only: [:create] do
        member do
          post :verify_otp
        end
      end
      resources :products, only: [:index, :show] do
        member do
          resources :product_likes, only: [:create]
        end
        resources :product_comments, only: [:index, :create]
      end
      resources :product_comments, only: [:destroy]
      resources :categories, only: [:index]
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end