Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'static_pages#landing'
  get 'contacts', to: 'static_pages#contacts'
  resources :clients
end
