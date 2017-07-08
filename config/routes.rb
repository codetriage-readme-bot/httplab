Rails.application.routes.draw do
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      post 'tokens' => 'user_token#create'
      resources :posts, only: [:index, :create]
      resources :ratings, only: [:create]
    end
  end
end
