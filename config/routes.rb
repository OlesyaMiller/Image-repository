Rails.application.routes.draw do
  root 'static#home'

  resources :albums 
  resources :users do
    resources :albums 
  end

  resources :albums do
    member do
      delete :delete_image_attachment
    end
  end

  get '/signin', to: "session#signin"
  post '/signin', to: "session#create"
  get '/logout', to: "session#destroy"
  
end
