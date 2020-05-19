# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  # devise_for :user do
  #   get ':user/edit-profile' => 'devise/registration#edit', :as => :edit_user_profile
  # end
  root to: 'pages#home'

  resources :users

  resource :profile

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
