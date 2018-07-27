Rails.application.routes.draw do
  
  # get 'projects/index'
  # get 'projects/new'
  # get 'projects/create'
  # get 'projects/index'
  # root 'bugs#index'

  root 'projects#index'
  resources :projects do
    member do
      get :assign
    end
    member do
      get :mark
    end
    resources :bugs
    
    end
  devise_for :users 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
