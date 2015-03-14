Rails.application.routes.draw do
  resources :runrecords

  root "runrecords#index"

end
