Rails.application.routes.draw do
  root 'games#index'
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  resources :games, except: :index do
    resources :critics, except: %i[index show]
    resources :involved_companies, only: %i[new create destroy]
    resources :genres, only: :index
    post 'add_genre', on: :member
    delete 'remove_genre', on: :member
    resources :platforms, only: :index
    post 'add_platform', on: :member
    delete 'remove_platform', on: :member
  end
  resources :companies, only: %i[new create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
