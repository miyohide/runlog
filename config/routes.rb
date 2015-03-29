Rails.application.routes.draw do
  resources :runrecords, except: [:destroy]
  resources :garmin_logs, only: [:new, :create]

  root "runrecords#index"

end
