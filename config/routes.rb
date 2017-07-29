Rails.application.routes.draw do
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'front/pages#index'

  # scope for removing '/head' in the path
  scope module: "head" do

  end

  namespace :admin do

  end

end
