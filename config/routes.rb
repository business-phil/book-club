# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#new'

  resources :books
  resources :clubs
  resources :members
  resources :sessions, only: %i[new create destroy]
end
