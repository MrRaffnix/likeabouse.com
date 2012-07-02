LikeabouseCom::Application.routes.draw do
  root :to => "categories#index"
  
  resources :posts, :only => [:show, :index]
  resources :categories, :only => [:show, :index]
  
  match "impressum" => "pages#imprint", as: "imprint"
  match "imprint" => "pages#imprint", as: "imprint"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
end
