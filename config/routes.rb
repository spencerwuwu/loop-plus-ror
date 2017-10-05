Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  root to: 'front/pages#index'

  get '/user' => 'front/user#show', as: :user_root # creates user_root_path
  get '/user/show', :to => 'front/user#show', :as => 'show_user'
  get '/user/uses', :to => 'front/user#uses', :as => 'user_uses'
  get '/user/points', :to => 'front/user#points', :as => 'user_points'
  get '/user/payments', :to => 'front/user#payments', :as => 'user_payments'

  # devise_for :users
  devise_for :users, controllers: { registrations: "users/registrations" }

  devise_scope :user do
    get '/users/edit_info', :to => 'users/registrations#edit_info', :as => 'edit_user_info'
    get '/nctuoauth', :to => 'users/omniauth_callbacks#nctu'
  end

  # scope for removing '/front' in the path
  scope module: "front" do
    get '/about' => 'pages#about', :as => 'about'
    get '/download' => 'pages#download', :as => 'download'
    get '/service' => 'pages#service', :as => 'service'
    get '/no_d2' => 'pages#no_d2', :as => 'no_d2'

    get '/notices/signup_email_sent' => 'notices#signup_email_sent', :as => 'notices_signup'
    resources :articles, only: [:index, :show]
    resources :orders, only: [:create, :show]
    resources :products, only: [:create, :show]
  end

  # scope for removing '/tail' in the path
  scope module: "tail" do
    get '/tail/' => 'pages#index', :as => 'tail'
  end

  namespace :tail do
    resources :products
    resources :orders, except: [:create]
    resources :refunds, except: [:create]

    root to: "pages#index"
  end

  namespace :admin do
    resources :articles
    resources :banners
    resources :spotlights
    resources :users
    resources :roles
    resources :vehicles
    resources :stations
    resources :user_uses
    resources :products
    resources :orders
    resources :refunds

    root to: "users#index"
  end


end
