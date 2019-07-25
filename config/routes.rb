Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static#home"
  get "/login", to: "sessions#new", as: "login"
  get "/signup", to: "users#new"

  resources :cohorts do
    resources :tasks, only: [:index, :show]
  end
  resources :tasks
  resources :users, only: [:index, :show, :new, :create]
end
