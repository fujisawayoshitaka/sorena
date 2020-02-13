Rails.application.routes.draw do
  get 'users/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }
  resources :users, only: [:show]
  resources :netas do
    resources :comments
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy]
  root to: "netas#index"
  resources :stations
end
