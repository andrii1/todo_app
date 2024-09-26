Rails.application.routes.draw do
  # resources :task_users
  devise_for :users
  root to: "pages#home"
  resources :tasks do
    # resources :users, only: [:new, :create]
    get "users_to_task", to: "users#users_to_task", as: :users_to_task
    post "add_users_to_task", to: "users#add_users_to_task", as: :add_users_to_task
    delete "delete_users_from_task", to: "users#delete_users_from_task", as: :delete_users_from_task
    # resources :task_users, only: [:new, :create]
  end
  # resources :task_users, only: [:destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

end
