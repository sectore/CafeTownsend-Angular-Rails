CafeTownsendAngularRails::Application.routes.draw do

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  root :to => "sessions#new"
  resources :sessions
end
