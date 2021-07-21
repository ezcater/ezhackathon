Ezhackathon::Application.routes.draw do
  root to: "layouts#index"
  namespace :api, defaults: { format: "json" } do
    resource :health_check, only: :show
  end

  resources :ideas, except: [:destroy]

  
  get "/projects", to: "projects#index"
  get "/hackathons", to: "hackathons#index"
  end
