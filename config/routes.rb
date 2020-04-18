Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  resources :users, only: [:index, :show, :edit]
  resources :books do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
end
