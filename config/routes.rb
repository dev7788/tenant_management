Rails.application.routes.draw do
  resources :widgets

  resources :customers, except: [:show]
  get 'customers/widget_counts'

  devise_for :users, :controllers => { invitations: 'devise/invitations' }

  resources :user_links, only: [:create, :destroy]

  resources :users do
    post :invite, :on => :collection
  end

  root to: 'visitors#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
