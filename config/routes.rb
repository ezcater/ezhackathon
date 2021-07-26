# frozen_string_literal: true

Ezhackathon::Application.routes.draw do
  root to: "layouts#index"
  namespace :api, defaults: { format: "json" } do
    resource :health_check, only: :show
  end

  resources :ideas, except: [:destroy]
  resources :events, except: [:destroy]

  get "/projects", to: "projects#index"
end
