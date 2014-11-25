Rails.application.routes.draw do
  root "movies#index"

	get "signup" => "users#new"
	get "signin" => "sessions#new"

  get "movies/filter/:scope" => "movies#index", as: :filtered_movies

  resource :session
  resources :genres
  resources :users
  resources :movies do
    resources :reviews
    resources :favorites
  end
end
