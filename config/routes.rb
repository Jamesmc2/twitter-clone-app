Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tweets#index"

  get "/users" => "users#index"
  get "/users/:id" => "users#show"
  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/users/:id/edit" => "users#edit"
  patch "/users/:id" => "users#update"
  get "/users/:id/liked_tweets" => "users#liked_tweets"

  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"

  post "relationships" => "relationships#create"
  delete "relationships/:id" => "relationships#destroy"

  get "/myfeed" => "tweets#index"
  get "/tweets/new" => "tweets#new"
  post "/tweets" => "tweets#create"
  delete "/tweets/:id" => "tweets#destroy"

  post "/likes" => "likes#create"
  delete "/likes/:id" => "likes#destroy"
end
