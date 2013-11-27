PostitTemplate::Application.routes.draw do
  root to: 'sessions#home'
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/document', to: 'sessions#doc'
  get '/about', to: 'sessions#about'


  resources :users
  resources :posts, except: [:index] do
  	resources :comments, only: [:create] do

  	end
  end

  resources :categories

  resources :doc_types do
    resources :docs, except: [:show]
  end

end
