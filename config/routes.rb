Rails.application.routes.draw do
  get "/dashboard" => "dashboard#index", as: :dashboard
  get "dashboard/properties"
  get "dashboard/reports"
  resources :properties
  devise_for :accounts
  root to: "public#main"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
