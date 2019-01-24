Rails.application.routes.draw do
  post '/auth', to: "auth#create"

  resources :companies do
    get :csv, on: :collection
  end

  resources :contacts do
    get :csv, on: :collection
  end

  resources :claims do
    get :csv, on: :collection
  end
end
