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


end
