Rails.application.routes.draw do
  resources :netas do
    collection do
      post :confirm
    end
  end
end
