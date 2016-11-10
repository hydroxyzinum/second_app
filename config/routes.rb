Rails.application.routes.draw do

  get 'posts/new'

  get 'sessions/new'

  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/carrier', to: 'static_pages#carrier'
  get '/contact', to: 'static_pages#contact'
  get '/partners', to: 'static_pages#partners'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/blog', to: 'posts#index'
  resources :users;

  resources :posts do
    resources :comments do
      member do
        put "like", to: "comments#like"
        put "dislike", to: "comments#dislike"
      end
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
