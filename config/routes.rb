# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'conversions#index'
  resources :conversions, only: %i[new create destroy]

  get '/settings', to: 'settings#index', as: 'settings'
  post '/settings-update', to: 'settings#update', as: 'settings_update'
end
