Rails.application.routes.draw do
  devise_for :users, path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'register'
    }

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :portfolios, except: [:show] do
    collection do
      put 'positions'
    end
  end
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  resources :blogs do
    member do
      post :toggle_status
    end
  end

  resources :topics, only: [:index, :show]

  mount ActionCable.server => '/cable'

  root 'pages#home'
end
