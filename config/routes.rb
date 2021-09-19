Rails.application.routes.draw do
  root 'static#home'

  resources :images
  resources :users
  resources :users do
    resources :images 
  end

  get '/signin', to: "session#signin"
  post '/signin', to: "session#create"
  get '/logout', to: "session#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
