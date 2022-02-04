Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords',
      unlocks: 'users/unlocks',
      confirmations: 'users/confirmations',
      invitations:'users/invitations'
    }

  resources :practice_areas do
    resources :services
  end
  resources :profiles, path: "attorneys"
  resources :services
  resources :articles, path: "insights" do

    collection do
      get 'tags', as: :tags
      get '/admin' => 'posts#admin', as: :admin
      get '/subscribe' => 'posts#subscribe', as: :subscribe
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'pages#landing'
  get 'pages/:page' => 'pages#show', as: :pages
  get 'privacy' => 'pages#show', page: 'privacy', as: :privacy
  get 'pricing' => 'pages#show', page: 'pricing', as: :pricing
  get 'terms' => 'pages#show', page: 'terms', as: :terms
  get 'contact' => 'pages#show', page: 'contact', as: :contact
  get 'about' => 'pages#show', page: 'about', as: :about
  get 'home' => 'pages#home'

  namespace :support do
    resources :feedbacks
  end
end
