Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  root to: 'front/pages#index'

#  devise_for :users
  devise_for :users, controllers: { registrations: "users/registrations" }

  devise_scope :user do
    get 'users/info', :to => 'users/registrations#info', :as => 'info_user_registration'
    get 'users/show', :to => 'users/registrations#show', :as => 'show_user_registration'
    get 'users/edit_info', :to => 'users/registrations#edit_info', :as => 'edit_info_user_registration'
    get '/nctuoauth', :to => 'users/omniauth_callbacks#nctu'
  end

  # scope for removing '/front' in the path
  scope module: "front" do
    get '/about' => 'pages#about'
    get '/download' => 'pages#download'
    get '/service' => 'pages#service'

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
