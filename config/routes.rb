Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :habits, only: [:index]

  get 'this_month', to: 'calendar#this_month'
end
