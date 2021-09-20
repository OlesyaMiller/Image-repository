Rails.application.routes.draw do
  root 'static#home'

  resources :albums 
  resources :users do
    resources :albums 
  end

  get '/signin', to: "session#signin"
  post '/signin', to: "session#create"
  get '/logout', to: "session#destroy"
end
