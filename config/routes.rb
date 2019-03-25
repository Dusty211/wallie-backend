Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit] do
        resources :jobs, except: [:new, :edit]
      end
      resources :messages, only: [:create, :show]
      resources :murals, except: [:new, :edit]
      resources :walls, except: [:new, :edit]
      mount ActionCable.server => '/cable'
    end
  end  
end
