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
  get "/help", to: 'home#help'
  post "/help_send", to: 'home#help_send', as: 'help_send'
  get "/fetch_posts", to: 'home#from_category'
  get "/fetch_answered_posts", to: 'requests#from_answered_category'
  get "/fetch_open_posts", to: 'requests#from_open_category'
  get "/requests/open", to: 'requests#open'
  get "/requests/answered", to: 'requests#answered'
  post "requests/add_request", to: 'requests#add_request_home'
  post "requests/open/add_request", to: 'requests#add_request_open'
  # post "requests/:id/answer", to: 'requests#answer', as: 'answer_request'
  post "requests/:id/add_description", to: 'requests#add_description', as: 'request_answer'
  get "/requests/:id", to: 'requests#show',  as: 'request'
  get 'ajax/:action', to: 'ajax#:action', :defaults => { :format => 'js' }
end
