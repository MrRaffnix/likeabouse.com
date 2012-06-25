LikeabouseCom::Application.routes.draw do
  root :to => "categories#index"
  
  resources :posts, :only => [:show, :index]
  resources :categories, :only => [:show, :index]
  
  match "impressum" => "pages#impressum", as: "impressum"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
end
