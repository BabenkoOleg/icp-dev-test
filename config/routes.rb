Rails.application.routes.draw do
  post '/auth', to: "auth#create"

  resources :companies
  resources :contacts
end
