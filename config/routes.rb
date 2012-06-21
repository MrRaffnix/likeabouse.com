LikeabouseCom::Application.routes.draw do
  root :to => "posts#index", :only => [:show, :index]
  
  resources :posts

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
end
