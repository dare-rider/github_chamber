Rails.application.routes.draw do

  devise_for :users , controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :repos, only: [:index] do
    collection do
      get 'commits'
    end
  end

  root "home#index"
end
