Rails.application.routes.draw do
  resources :runrecords, except: [:destroy]

  root "runrecords#index"

end
