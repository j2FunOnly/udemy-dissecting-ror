Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :portfolios, except: [:show]
  get 'porfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  resources :blogs do
    member do
      post :toggle_status
    end
  end
end
