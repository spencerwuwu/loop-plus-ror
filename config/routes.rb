Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  root to: 'front/pages#index'

  get '/user' => 'front/user#show', as: :user_root # creates user_root_path
  get '/user/show', :to => 'front/user#show', :as => 'show_user'
  get '/user/uses', :to => 'front/user#uses', :as => 'user_uses'
  get '/user/points', :to => 'front/user#points', :as => 'user_points'
  get '/user/payments', :to => 'front/user#payments', :as => 'user_payments'

#  devise_for :users
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

    resources :articles
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

    root to: "users#index"
  end


end
