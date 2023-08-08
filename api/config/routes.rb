Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  resources :runlogs
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
