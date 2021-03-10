Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'static_pages#landing'
  get 'contacts', to: 'static_pages#contacts'
  get 'sign_in', to: 'clients#sign_in'
  post 'sign_out', to: 'clients#sign_out'
  post 'check_sign_in', to: 'clients#check_sign_in'
  resources :clients
  resources :directions, only: :show
  resources :doctors
  resources :guest_questions
  resources :services
  resources :records do
    post 'cancel', to: 'records#cancel'
  end
end
