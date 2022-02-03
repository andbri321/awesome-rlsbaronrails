# frozen_string_literal: true

Rails.application.routes.draw do
  resources :auths, only: [:create]

  namespace :v1 do
    resources :cocktails do
      get 'random', on: :collection
      get 'list', on: :collection
    end
    resources :users
  end
end
