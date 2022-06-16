Rails.application.routes.draw do
  
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  root to: 'homes#top'
  get 'homes/about'
  get 'items/index'
  get 'items/show'
  devise_for :end_users, controllers: {
    sessions: 'end_users/sessions',
    registrations: 'end_users/registrations'
  }
  get 'customers/mypage' => 'customers#show', as: 'mypage'
  get 'customers/edit' => 'customers#edit'
  patch 'customers/update' => 'customers#update'
  get 'customers/confirm' => 'customers#confirm'
  patch 'customers/withdraw' => 'customers#withdraw'
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
  }
  namespace :admin do
    root to: 'homes#top'
    resources :customers
    resources :genres
  end
end
