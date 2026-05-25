Rails.application.routes.draw do
  root "pages#home"
  get "/home", to: "pages#home"
  get "/pages/home", to: "pages#home"
  
  get "/signup", to: "chefs#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :recipes 
  resources :chefs , only: [ :create, :show, :edit, :update , :destroy , :index ] 

end
