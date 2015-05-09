Rails.application.routes.draw do
  root "runrecords#index"

  resources :users
  resources :user_sessions

  resources :runrecords, except: [:destroy]
  resources :garmin_logs, only: [:create]

  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout

end
