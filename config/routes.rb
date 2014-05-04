Antano::Application.routes.draw do
  root "home#index"

  get "admin", to: "admin#index"
  get "acerca", to: "home#about", as: :about

  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  get "login", to: "sessions#index", as: :login
  get "logout", to: "sessions#destroy", as: :logout

  resources :photos, path: "p", only: :show

  namespace :admin do
    resources :photos do
      member do
        post :allow
        post :publish
      end
    end
  end
end
