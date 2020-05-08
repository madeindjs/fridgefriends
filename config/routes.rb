# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:index]

  resource :profile, only: [:show]

  resources :relationships, only: %i[index new create] do
    member do
      patch :accept
      patch :decline
    end
  end

  resources :donations, only: [:index]
  namespace :receiver do
    resources :donations, only: [:index] do
      member do
        patch :choose
      end
    end
  end

  namespace :giver do
    resources :donations, only: %i[index new create] do
      member do
        patch :confirm
      end
    end
  end
end
