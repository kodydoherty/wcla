PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/document', to: 'sessions#doc'
  get '/forsale', to: 'sessions#sale'

  resources :users
  resources :posts do
  	resources :comments do

  	end
  end

  resources :categories, only: [:show, :new, :create]

end
