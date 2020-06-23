Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  namespace 'api' do
    namespace 'v1' do
    end
  end
  root 'api/v1/users#index'
end
