Rails.application.routes.draw do
  resources :todos

  root to: 'main#index'
end
