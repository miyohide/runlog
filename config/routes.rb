Rails.application.routes.draw do
  root 'runlogs#index'
  resources :courses
  resources :shoes
  resources :runlogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
