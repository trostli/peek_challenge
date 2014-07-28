PeekChallenge::Application.routes.draw do

    namespace :api, defaults: {format: 'json'} do
      resources :timeslots, only: [:index, :create]
      resources :boats, only: [:index, :create]
      resources :assignment, only: :create
      resources :booking, only: :create

      post 'timeslot', to: 'timeslots#create'
      post 'boat', to: 'boats#create'
    end

end
