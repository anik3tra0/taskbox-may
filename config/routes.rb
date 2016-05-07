Rails.application.routes.draw do

  get 'api/sandbox/client_details'

  resources :categories
  get 'tasks/mark_as_complete'
  devise_for :users
  resources :clients 
  resources :projects
  resources :tasks

  root 'clients#index'

  
  resources :movies
  get 'sandbox/clients'

  get 'sandbox/projects'

  get 'sandbox/tasks'

  get 'say/hello'

  resources :restaurants
  resources :products
  
  
  post 'api/projects/projects_by_category'
  

end
