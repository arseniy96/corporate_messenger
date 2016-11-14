Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'

  resources :rooms do
    member do
      get :invite_friends
      resource :chats, only: [:show] do
        resources :messages, only: [:create]
      end
    end
    resources :tasks
  end

  resources :users do
    get :add_friend, on: :member
  end
  resources :chats do
    resources :messages, only: [:create]
  end

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
