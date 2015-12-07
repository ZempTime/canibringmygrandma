Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }

  resources :photos do
    collection do
      get :answer
    end
    resources :votes
  end

  root to: "home#index"
end
