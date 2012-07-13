LikeabouseCom::Application.routes.draw do
  root :to => "posts#recent"
  match "imprint" => "pages#imprint", as: "imprint"
  match "about" => "pages#about", as: "about"
  
  resources :posts, :only => [:show] do
    collection do
      get 'recent'
    end
  end
  
  resources :categories, :only => [:show]
  

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
end
