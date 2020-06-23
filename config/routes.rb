Rails.application.routes.draw do
  get 'static/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  namespace 'api' do
    namespace 'v1' do
    end
  end
  root 'static#index'
end
