Rails.application.routes.draw do
  root 'static_pages#index'

  devise_for :users
  devise_scope :user do
    get 'sign_in' => 'devise/sessions#new'
    get 'sign_up' => 'devise/registrations#new'
    get 'edit' => 'devise/registrations#edit'
    get 'sign_out' => 'devise/sessions#destroy'
    get 'forgot_password' => 'devise/passwords#new'
    get 'change_password' => 'devise/passwords#edit'
  end

  get 'check_email' => 'user/users#check_email'

  get 'menu' => 'foods#index'
  post'get_foods_for_date' => 'foods#get_foods_for_date'

  post 'new_order' => 'orders#create'

  namespace :admin do
    resources :users, only: [:index]
    resources :orders, only: [:index]
    get 'get_orders_for_date' => 'orders#get_orders_for_date'
    resources :foods, only: [:new, :create]
  end

  namespace :api do
    namespace :v1 do
      resources :orders, only: [:index]
      devise_for :users
    end
  end
end
