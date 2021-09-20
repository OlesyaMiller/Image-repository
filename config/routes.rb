Rails.application.routes.draw do
  resources :albums
  root 'static#home'

  resources :users do
    resources :images 
  end

  get '/signin', to: "session#signin"
  post '/signin', to: "session#create"
  get '/logout', to: "session#destroy"
end
