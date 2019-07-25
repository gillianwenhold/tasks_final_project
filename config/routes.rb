Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cohorts do
    resources :tasks, only: [:index, :show]
  end
  resources :tasks
  resources :users, only: [:index, :show, :new, :create]
end
