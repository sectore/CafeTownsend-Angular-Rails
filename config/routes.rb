CafeTownsendAngularRails::Application.routes.draw do
  get 'login', to: 'sessions#create', as: :login
  resources :sessions
  resources :employees
  root to: 'sessions#create'
end
