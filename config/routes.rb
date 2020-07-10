Rails.application.routes.draw do
  devise_for :admins, :skip => [:registrations], controllers: {
    sessions: 'admins/sessions'
  }
  
  get 'games/index'
  get 'games/new'
  get 'games/edit'
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'

  root 'pages#home'

  resources :teams
  resources :games, path: :matches
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
