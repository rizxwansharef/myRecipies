Rails.application.routes.draw do
  root "pages#home"
  get "/home", to: "pages#home"
  get "/pages/home", to: "pages#home"
  
  get "/signup", to: "chefs#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  match "/logout", to: "sessions#destroy", via: [:get, :delete]

  resources :ingredients, only: [:index, :show, :new, :create, :destroy]
  resources :recipes do
    resources :comments, only: [:create, :destroy]
  end
  resources :chefs , only: [ :create, :show, :edit, :update , :destroy , :index ] 

end
