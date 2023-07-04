Rails.application.routes.draw do
  
  root to: "homes#top"
  devise_for :users
  get 'homes/about' => 'homes#about',as: 'about'
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  
end
