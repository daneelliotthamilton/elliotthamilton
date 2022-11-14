Rails.application.routes.draw do
  
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords',
      unlocks: 'users/unlocks',
      confirmations: 'users/confirmations',
      invitations:'users/invitations'
    }

  get '/admin' => 'admin/dashboard#index', as: :admin_dashboard

  scope path:'admin', module: 'admin', as: 'admin' do
    resources :articles do 
      member do 
        patch '/publish' => 'articles#publish', as: :publish
        patch '/unpublish' => 'articles#unpublish', as: :unpublish
        patch '/schedule' => 'articles#schedule', as: :schedule
        patch '/unschedule' => 'articles#unschedule', as: :unschedule
      end
    end
    resources :pages
    resources :profiles
    resources :practice_areas do
      resources :services
    end
    resources :services
  end

  resources :practice_areas, only: [:index, :show] do
    resources :services, only: [:index, :show]
  end
  resources :profiles, path: "attorneys", only: [:index, :show]
  resources :services, only: [:index, :show]
  resources :articles, path: "insights", only: [:index, :show] do

    collection do
      get 'tags', as: :tags
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
