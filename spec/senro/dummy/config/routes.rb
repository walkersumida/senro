Rails.application.routes.draw do
  namespace :api do
    resources :items
  end
  resources :items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
