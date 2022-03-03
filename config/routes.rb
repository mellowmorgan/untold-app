Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'home#index'
  root to: 'home#index'
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
  # get "/fetch_posts" => 'home#from_category', as: 'fetch_posts'
  get "/fetch_posts", to: 'home#from_category'
end
