Rails.application.routes.draw do
    mount_devise_token_auth_for 'User', at: '/auth', skip: [:omniauth_callbacks]
    resources :pings, only: [:create, :index, :update, :show]
    resources :pongs, only: [:create, :update, :destroy]
    resources :communities, only: [:index]
    namespace :admin do
        resources :communities, only: [:index, :update]
    end
end
