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


    get '/pay/:id' => 'orders#pay', :as => 'pay_order'

    get '/user/to_pending' => 'user#to_pending', :as  => 'user_to_pending'
    get '/user/back_pending' => 'user#back_pending', :as  => 'user_back_pending'

    get '/notices/signup_email_sent' => 'notices#signup_email_sent', :as => 'notices_signup'
    resources :articles, only: [:index, :show]
    resources :orders, only: [:create, :show]
    resources :products, only: [:index, :show]
  end

  # scope for removing '/tail' in the path
  scope module: "tail" do
    get '/tail/' => 'pages#index', :as => 'tail'

    get '/user/user_auth/:id/:reason' => 'users#user_auth', :as  => 'tail_user_auth'
    get '/user/user_reject/:id/:reason' => 'users#user_reject', :as  => 'tail_user_reject'
  end

  namespace :tail do
    resources :products
    resources :orders, except: [:create]
    resources :refunds, except: [:create]
    resources :users
    resources :gifts

    root to: "pages#index"

    get '/user/status_pending' => 'users#status_pending', :as => 'user_pending'
    get '/user/status_member' => 'users#status_member', :as => 'user_member'
    get '/user/status_un_finish' => 'users#status_un_finish', :as => 'user_un_finish'

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
    resources :payment_configs

    root to: "users#index"
  end


end
