Rails.application.routes.draw do
  resources :reactions
  resources :articles
  resources :tweets
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
    get "signin" => 'devise/sessions#new'
    delete "signout" => 'devise/sessions#destroy'
    get 'signup' => 'devise/registrations#new'
  end
  root 'pages#home'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'tweets' => 'pages#tweets'
  get 'articles' => 'pages#articles'
  get 'reactions' => 'pages#reactions'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
