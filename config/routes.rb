Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'home#index'
  root to: 'react_home#index'
  get 'api/v1/requests/published', to: 'api/v1/requests#published'
  namespace :api do
    namespace :v1 do
      resources :requests do
        resources :descriptions do
        end  
      end
      get 'descriptions', to: 'descriptions#index'
      get 'descriptions/:id', to: 'descriptions#show'
    end    
  end

end
