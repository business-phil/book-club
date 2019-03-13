# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#new'

  resources :books

  resources :clubs do
    member do
      get 'join'
      get 'leave'
    end
  end

  resources :members

  resources :sessions, only: %i[new create destroy]
end
