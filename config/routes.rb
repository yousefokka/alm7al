Rails.application.routes.draw do
  
  devise_for :users
      namespace :api do
        namespace :v1 do
          resources :sessions, :only => [:create, :destroy] 
          resources :users, :only => [:show, :create, :update, :destroy]  do 
            resources :categories do 
              resources :items
            end
          end
        end
      end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
