Rails.application.routes.draw do
  get 'contact/index'
  get 'work/index'
  get 'about/index'
  get 'home/index'
 devise_for :users
 resources :articles do
  collection do
    get 'tag'
  end
 end
 resources :users
 root to: 'home#index' 
end
