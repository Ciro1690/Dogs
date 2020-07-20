Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dogs do
    resources :toys, only: [:index] #nested routes
  end
  resources :toys, only: [:show, :create, :update, :destroy] #top-level routes
end
