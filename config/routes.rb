Rails.application.routes.draw do
    mount_devise_token_auth_for 'User', at: '/auth', skip: [:omniauth_callbacks]
    resources :pings, only: [:create, :index]
    resources :pongs, only: [:create]
    resources :communities, only: [:index, :update]
end
