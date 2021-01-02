Rails.application.routes.draw do
 devise_for :users
 resources :articles do
  collection do
    get 'tag'
  end
 end
 resources :users
 root to: 'articles#index' 
end
