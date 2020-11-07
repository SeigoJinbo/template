Rails.application.routes.draw do
  # get 'characters/index'
  # get 'characters/show'
  # get 'characters/edit'
  # get 'characters/new'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :characters
  resources :starships


end
