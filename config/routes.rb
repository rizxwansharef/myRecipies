Rails.application.routes.draw do
  root "pages#home"
  get "/home", to: "pages#home"
  get "/pages/home", to: "pages#home"

  devise_for :chefs, controllers: {
        sessions: 'chefs/sessions'
      }
  resources :ingredients, only: [ :index, :show, :new, :create, :destroy ]
  resources :recipes do
    resources :comments, only: [ :create, :destroy ]
  end
  resources :chefs, only: [ :create, :show, :edit, :update, :destroy, :index ]
end
