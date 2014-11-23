Rails.application.routes.draw do
  resources :favorites

	get "signup" => "users#new"
	get "signin" => "sessions#new"
	resource :session
  root "movies#index"  

  resources :users
  resources :movies do
    resources :reviews
  end
end
