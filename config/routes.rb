Rails.application.routes.draw do
  get '/health_check', to: "health_check#index"

  namespace :api do
    namespace :v1 do
      scope :users do
        resource :me, controller: 'me', only: %i[show]
      end
      resources :canvases, only: %i[index show create] do
        post ':canvas_id/labels', to: 'labels#create', on: :collection
      end
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
          registrations: 'api/v1/auth/registrations'
      }
    end
  end
end
