CafeTownsendAngularRails::Application.routes.draw do


  #match "logout" => "sessions#destroy", :as => "logout"
  match "login" => "sessions#create", :as => "login"

  root :to => "sessions#create"

  resources :sessions
  resources :employees

end
