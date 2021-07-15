Ezhackathon::Application.routes.draw do
  namespace :api, defaults: { format: "json" } do
    resource :health_check, only: :show
  end

  root to: "layouts#index"
  get "/projects", to: "projects#index"
  get "/ideas", to: "ideas#index"
  get "/ideas/:name", to: "ideas#show"

  get "/hackathons", to: "hackathons#index"
  end
