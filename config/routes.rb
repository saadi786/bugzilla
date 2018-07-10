Rails.application.routes.draw do
  get 'bugs/index'
  get 'bugs/new'
  get 'bugs/create'
  get 'bugs/edit'
  get 'bugs/show'
  # get 'projects/index'
  # get 'projects/new'
  # get 'projects/create'
  # get 'projects/index'
  # root 'bugs#index'
  resources :projects
  resources :bugs
  root 'projects#index'
  devise_for :users 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
