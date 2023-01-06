Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'conversions#index'
  get '/new-conversion', to: 'conversions#new', as: 'new_conversion'
  post '/create-conversion', to: 'conversions#create', as: 'create_conversion'
  
    get '/settings', to: 'settings#index', as: 'settings'
    post '/settings-update', to: 'settings#update', as: 'settings_update'
end
