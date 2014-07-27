PeekChallenge::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example resource route within a namespace:
    namespace :api, defaults: {format: 'json'} do
      resources :timeslot, only: [:index, :create]
      resources :boat, only: [:index, :create]
      resources :assignment, only: :index
      resources :booking, only: :create
    end
end
