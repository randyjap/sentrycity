Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :stores do
    post 'store_vote', on: :member
  end

  resources :s, only: [:index]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
