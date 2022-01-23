Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'events#index'
  resources :events do
    resources :event_attendees
  end
  get 'user/:id', to: 'user#show', as: 'user'
end
