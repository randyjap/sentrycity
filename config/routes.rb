Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :stores do
    post 'store_vote', on: :member
    post 'comments', on: :member
    post 'bookmark', on: :member
  end

  resources :comments, only: [:destroy] do
    post 'comment_vote', on: :member
  end

  resources :s, only: [:index]
  post 's', to: 's#search'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
