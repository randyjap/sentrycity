Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :stores, only: [:show, :edit, :update, :create] do
    post 'store_vote', on: :member
    post 'comments', on: :member
    post 'bookmark', on: :member
  end

  resources :comments, only: [:destroy] do
    post 'comment_vote', on: :member
  end

  resources :s, only: [:index]
  post 's', to: 's#search'
  resources :photo_uploads, only: [:create, :destroy]
  get 'create-a-store', to: 'stores#create_a_store'
  put 'create-a-store', to: 'stores#update_create_a_store'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
