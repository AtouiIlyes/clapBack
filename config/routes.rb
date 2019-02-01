Rails.application.routes.draw do


  resources :contracts
  devise_for :users,
          path: '',
          path_names: {
            sign_in: 'login',
            sign_out: 'logout',
            registration: 'signup'
          },
          controllers: {
            sessions: 'sessions',
            registrations: 'registrations'
          }

  namespace :api do
    namespace :v1 do
      resources :clients do
        resources :contracts
      end

      resources :users
      resources :user_types
      resources :roles
      resources :permissions, only: [:index]
    end
  end

end