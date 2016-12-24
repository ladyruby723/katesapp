Rails.application.routes.draw do
    get 'feed', to: 'feed#show'

    resources :users, only: :show, param: :username do
      member do
        post 'follow', to: 'follows#create'
        delete 'unfollow', to: 'follows#destroy'
      end
    end
    resources :reactions
    resources :articles
    resources :tweets
    ActiveAdmin.routes(self)
    devise_for :users
    as :user do
      get "signin", to: 'devise/sessions#new'
      delete "signout", to: 'devise/sessions#destroy'
      get 'signup', to: 'devise/registrations#new'
    end
    root 'pages#home'
    get 'about' => 'pages#about'
    get 'contact' => 'pages#contact'
    get 'tweets' => 'pages#tweets'
    get 'articles' => 'pages#articles'
    get 'reactions' => 'pages#reactions'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end