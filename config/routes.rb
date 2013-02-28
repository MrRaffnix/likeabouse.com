LikeabouseCom::Application.routes.draw do
  root :to => "posts#index"
  match "imprint" => "pages#imprint", as: "imprint"
  match "about" => "pages#about", as: "about"
  match "feed" => "posts#feed", as: "feed", :format => :rss

  resources :posts, :only => [:show] do
    collection do
      get 'feed'
      get 'search'
    end
  end

  resources :categories, :only => [:show]

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
end
