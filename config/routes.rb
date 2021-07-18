Rails.application.routes.draw do
  devise_for :admins
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :demos, only: [:index, :create, :update, :show]
  resources :veterinary_appointments, only: [:index, :create, :update, :show]
  resources :adopters, only: [:index, :create, :update, :show]
  resources :pets, only: [:index, :create, :update, :show]
  resources :adoptions, only: [:index, :create, :update, :show]
end
