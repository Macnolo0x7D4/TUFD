Rails.application.routes.draw do

  devise_for :admin
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :articles do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end

  resources :categories

  namespace :users do
    get ':id/profile/', :to => 'profile#show', :as => :profile
    get ':id/profile/articles', :to => 'profile#articles', :as => :articles
  end

  root to: 'home#index'

  get 'explore', :to => 'home#explore', :as => :explore
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
