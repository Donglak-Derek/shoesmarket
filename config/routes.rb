Rails.application.routes.draw do

  get 'main' => 'users#index'

  get 'shoes/index'

  root 'users#index'

  get 'users/index'
  resources :users

  post 'sessions' => 'sessions#create'

  delete 'sessions/:id' => 'sessions#destroy'

  get 'shoes' => 'shoes#index'

  get 'dashboard/:id' => 'shoes#show'

  post 'shoes' => 'shoes#create'

  patch 'shoes/:id' => 'shoes#update'

  delete 'shoes/:id' => 'shoes#destroy'

  
end
