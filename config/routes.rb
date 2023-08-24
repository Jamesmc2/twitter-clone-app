Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tweets#index"
  get "/users" => "users#index"
  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"

  post "relationships" => "relationships#create"
  delete "relationships/:id" => "relationships#destroy"

  get "/myfeed" => "tweets#index"
  get "/tweets/new" => "tweets#new"
  post "/tweets" => "tweets#create"
end
