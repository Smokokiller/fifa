Rails.application.routes.draw do
  devise_for :users
  resources :tournaments

  root "tournaments#index"
end
