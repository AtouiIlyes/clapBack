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

      get 'clients/contacts', to: 'clients#contacts', as: :clients_contacts

      resources :clients do
        resources :contracts
      end
      resources :contracts
      resources :users
      resources :user_types
      resources :roles
      resources :contacts
      resources :proceedings
      resources :steps
      resources :permissions, only: [:index]
    end
  end

end