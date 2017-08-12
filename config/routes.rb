Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  root to: 'front/pages#index'

#  devise_for :users
  devise_for :users, controllers: { registrations: "users/registrations"}

  devise_scope :user do
    get 'users/info', :to => 'users/registrations#info', :as => 'info_user_registration'
    get 'users/show', :to => 'users/registrations#show', :as => 'show_user_registration'
    get 'users/edit_info', :to => 'users/registrations#edit_info', :as => 'edit_info_user_registration'
  end

  # scope for removing '/head' in the path
  scope module: "head" do

  end

  namespace :admin do
    resources :users
    resources :roles

    root to: "users#index"
  end


end
