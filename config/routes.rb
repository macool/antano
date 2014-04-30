Antano::Application.routes.draw do
  root "home#index"

  get "admin", to: "admin#index"
  get "acerca", to: "home#about", as: :about

  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]

  resources :photos, path: "p", only: :show

  namespace :admin do
    resources :photos do
      member do
        post :allow
        post :share
      end
    end
  end
end
