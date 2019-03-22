Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit]
      resources :jobs, except: [:new, :edit, :index]
      resources :murals, except: [:new, :edit]
      resources :walls, except: [:new, :edit]
      resources :messages, only: [:create, :show]
    end
  end  
end
