Ezhackathon::Application.routes.draw do
  resources :hackathons, only: [:index]
  namespace :api, defaults: { format: "json" } do
    resource :health_check, only: :show
  end

  # get "/projects", to: "projects#index"
  # get "/ideas", to: "ideas#index"
  # get "/hackathons", to: "hackathons#index"
  end
