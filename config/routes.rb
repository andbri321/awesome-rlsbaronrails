# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :v1 do
    resources :cocktails do
      get 'random', on: :collection
      get 'list', on: :collection
    end
  end
end
