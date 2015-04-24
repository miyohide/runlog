Rails.application.routes.draw do
  get 'user_sessions/new'

  get 'user_sessions/create'

  get 'user_sessions/destroy'

  resources :users

  resources :runrecords, except: [:destroy]
  resources :garmin_logs, only: [:create]

  root "runrecords#index"

end
