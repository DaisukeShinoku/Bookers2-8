Rails.application.routes.draw do
# 一番上に上げたらうまく動いた、理由不明
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
    member do
      get :follows, :followers
    end
  end
  resources :books do
  	resources :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  resources :relationships,       only: [:create, :destroy]
  get 'home/about' => 'home#about'
  root to: 'home#top'
  get "search" => "search#search"

end
