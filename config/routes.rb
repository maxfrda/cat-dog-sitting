# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'dashboards#home'

  get '/admin', to: 'admin#home'
  resources :bookings, only: %i[create show new]
end
