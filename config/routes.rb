Rails.application.routes.draw do
  resources :users

  resources :runrecords, except: [:destroy]
  resources :garmin_logs, only: [:create]

  root "runrecords#index"

end
