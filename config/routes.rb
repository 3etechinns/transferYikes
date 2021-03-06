Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#root'

  namespace :api, defaults: { format: :json } do
    resource :session, only: [:create, :destroy]
    resources :users, only: [:create, :show, :index] do 
      collection do 
        get 'recipients'
      end
    end

    resources :wallets, only: [:show, :update]
    resources :currencies, only: [:create, :show, :index, :update, :destroy]
    resources :transactions, only: [:create, :index, :show] do 
      collection do 
        post 'deposit'
      end
    end
  end
end
