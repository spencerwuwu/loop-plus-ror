Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :roles

    root to: "users#index"
  end

  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'front/pages#index'

  # scope for removing '/head' in the path
  scope module: "head" do

  end

end
