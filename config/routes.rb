Rails.application.routes.draw do
  
  
  devise_for :admins
  resources :itemimages
  devise_for :users
      namespace :api do
        namespace :v1 do
          resources :sessions, :only => [:create, :destroy] 
          resources :admins, :only => [:create]  do 
            resources :categories do  
              resources :items do
                resources :itemimages
              end
            end
          end 
          resources :users do 
            resources :orders do 
              resources :carts
              end
          end 
          resources :categories do   :only => [:show , index] 
            resources :items do   :only => [:show , index]
        end 
      end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
