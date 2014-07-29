PeekChallenge::Application.routes.draw do

    namespace :api, defaults: {format: 'json'} do
      resources :timeslots, only: [:index, :create]
      resources :boats, only: [:index, :create]
      resources :assignments, only: [:index, :create]
      resources :bookings, only: [:index, :create]

      post 'timeslot', to: 'timeslots#create'
      post 'boat', to: 'boats#create'
      post 'assignment', to: 'assignments#create'
      post 'booking', to: 'bookings#create'
    end

end
