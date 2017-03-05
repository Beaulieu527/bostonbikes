Rails.application.routes.draw do
  ddevise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  resources :users
  resources :products
  get 'static_pages/about'
  get 'static_pages/contact'
  #root 'static_pages#index'
  get 'static_pages/index'
  root 'static_pages#landing_page'
  get 'static_pages/landing_page'
  post'static_pages/thank_you'
  
  resources :orders, only: [:index, :show, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
