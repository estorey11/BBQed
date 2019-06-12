Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :recipes, only: [:index, :show, :new, :edit]
  end


  resources :recipes

  root 'welcome#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get 'users/home' => 'users#home'

  get '/auth/google/callback' => 'sessions#create_google'
end
