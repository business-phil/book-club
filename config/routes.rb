# frozen_string_literal: true

Rails.application.routes.draw do
  resources :club, only: [:index, :show]
end
