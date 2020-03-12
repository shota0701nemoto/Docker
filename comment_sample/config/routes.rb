Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :show, :create] do
    resources :comments, only: [:create]
  end

  root 'posts#index'
end
