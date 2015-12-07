Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }

  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  mount ImageUploader.direct_endpoint => "/photos/images"

  resources :photos do
    collection do
      get :answer
    end
    resources :votes
  end

  root to: "home#index"
end
