Rails.application.routes.draw do
  root to: 'home#index'
  resources :users do
    resources :tools, only: [:new, :show, :edit, :create, :destroy]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
