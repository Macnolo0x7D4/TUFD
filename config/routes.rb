Rails.application.routes.draw do

  devise_for :admins
  resources :articles do
    resources :comments
  end

  resources :categories

  devise_for :users
  root to: 'home#index'

  get 'users/:id/articles', to: 'users#articles'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
