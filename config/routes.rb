LikeabouseCom::Application.routes.draw do
  root :to => "posts#index"
  
  resources :posts, :only => [:show, :index]
  match "impressum" => "pages#impressum", as: "impressum"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
end
