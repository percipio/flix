Rails.application.routes.draw do
  root "movies#index"

  get "signin" => "sessions#new"
  get "signup" => "users#new"

  get "genre/:genre" => "movies#index", as: :genre_movies
  get "movies/filter/:filter" => "movies#index", as: :filtered_movies
  resources :movies do
    resources :reviews
    resources :favorites
  end
  
  resources :genres
  resources :users
  resource :session, only: [:new, :create, :destroy]
end
