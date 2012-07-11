LikeabouseCom::Application.routes.draw do
  root :to => "posts#recent"
  
  resources :posts, :only => [:show, :index]
  resources :categories, :only => [:show, :index]
  
  match "imprint" => "pages#imprint", as: "imprint"
  match "about" => "pages#about", as: "about"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
end
