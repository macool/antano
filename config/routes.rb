Antano::Application.routes.draw do
  root "home#index"

  get :acerca, to: "home#about", as: :about

  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  get :login, to: "sessions#index", as: :login
  get :logout, to: "sessions#destroy", as: :logout

  resources :photos, path: "p", only: :show

  get :admin, to: "admin#index"
  namespace :admin do
    resources :users
    resources :photos do
      member do
        post :allow
        post :publish
      end
    end
  end

  get :management, to: "management#index"
  namespace :management do
    resources :pending_photos
  end
end
