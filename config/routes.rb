Rails.application.routes.draw do
  # resources :task_users
  devise_for :users
  root to: "pages#home"
  resources :tasks do
    resources :task_users, only: [:new, :create]
  end
  resources :task_users, only: [:destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

end
