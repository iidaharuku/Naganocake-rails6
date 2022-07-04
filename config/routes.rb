Rails.application.routes.draw do

  root to: 'homes#top'
  get 'homes/about'
  resources :items
  devise_for :end_users, controllers: {
    sessions: 'end_users/sessions',
    registrations: 'end_users/registrations'
  }
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :cart_items
  get 'customers/mypage' => 'customers#show', as: 'mypage'
  get 'customers/edit' => 'customers#edit'
  patch 'customers/update' => 'customers#update'
  get 'customers/confirm' => 'customers#confirm'
  patch 'customers/withdraw' => 'customers#withdraw'
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  resources :orders, only: [:new, :create, :index, :show]
  get 'orders/complete' => 'orders#complete'
  post 'orders' => 'orders#create'
  post 'orders/confirm' => 'orders#con'
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
  }
  namespace :admin do
    root to: 'homes#top'
    resources :customers
    resources :genres
    resources :items
  end
end
